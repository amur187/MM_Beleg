import controlP5.*;

import websockets.*;

ControlP5 cp5;
WebsocketClient wsc;
int now;
boolean newEllipse;
String message;
Textarea nachrichten;
Textarea scoreBoard;
String nickname;
PShape bgChatNachrichten;
PShape bgScoreBoard;
PShape bgWerkzeugleiste;

boolean pinsel;
boolean fuellen;

ButtonFill farbleiste;


float[] mouseData = new float[6];

void setup() {
  nickname = "Klara";
  size(1280, 800);
  int chatBreite = 179;
  int chatHoehe = height - 230;
  cp5 = new ControlP5(this);


  cp5.addSlider("pinselGroesse").setPosition(100, 50).setRange(1, 20);
  cp5.addButton("fuellen").setPosition(200, 100).setSize(50, 100);
  cp5.addButton("pinsel").setPosition(100, Y_POS).setSize(BUTTON_BREITE, BUTTON_HOEHE);
  

  //Werkzeugleiste
  bgWerkzeugleiste = createShape(RECT, 50, 50, 100, 150);
  bgWerkzeugleiste.setFill(color(0, 100, 250));

  //Farbbuttons
  farbleiste = new ButtonFill();




  //Textnachrichten darstellen und Hintergrund vom Textfeld 
  nachrichten = cp5.addTextarea("Nachrichten").setPosition(width-chatBreite, 250).setSize(chatBreite, chatHoehe-50).scroll(2).setFont(createFont("Arial", 12));
  nachrichten.setText(nachrichten.getText());
  bgChatNachrichten = createShape(RECT, width - chatBreite, 250, chatBreite, height);
  bgChatNachrichten.setFill(color(0, 0, 0));
  
  //Eingabefeld am Boden des Textfeldes
  cp5.addTextfield("Chateingabe").setPosition(width-chatBreite +2, height - 24).setSize(chatBreite -2, 20).setVisible(true);



  //Scoreboard
  scoreBoard = cp5.addTextarea("Scoreboard").setPosition(width-chatBreite, 0).setSize(chatBreite, height - chatHoehe).scroll(2).setFont(createFont("Arial", 12));
  scoreBoard.setText(nachrichten.getText());
  bgScoreBoard = createShape(RECT, width - chatBreite, 0, chatBreite, height - chatHoehe);
  bgScoreBoard.setFill(color(0, 0, 0));




  newEllipse=true;

  //Here I initiate the websocket connection by connecting to "ws://localhost:8025/john", which is the uri of the server.
  //this refers to the Processing sketch it self (you should always write "this").
  
  try{
  wsc= new WebsocketClient(this, "ws://localhost:8025/john");}
  finally{}
  wsc.sendMessage("join"+nickname);
  now=millis();

  //Hintergrund vom Textfeld
}

public void pinsel() {
  fuellen = false;
  pinsel = true;
}

public void fuellen() {
  pinsel = false;
  fuellen = true;
}


void draw() {
  shape(bgChatNachrichten);
  shape(bgScoreBoard);
  message = "";
  message = cp5.get(Textfield.class, "Chateingabe").getText();
  zeichnen();

  lineData();
  line(mouseData[0], mouseData[1], mouseData[2], mouseData[3]);
}


void lineData() {
  stroke(mouseData[4]);
  strokeWeight(mouseData[5]);
}

void zeichnen() {
  float linienFarbe = 20;
  float linienDicke = cp5.get("pinselGroesse").getValue();


  stroke(linienFarbe);
  strokeWeight(linienDicke);
  if (mousePressed == true) {
    
    
    if (pinsel == true) {
      line(mouseX, mouseY, pmouseX, pmouseY);
   
    
      wsc.sendMessage("draw"+ ":" + mouseX + ":" + mouseY + ":" + pmouseX + ":" +pmouseY + ":" + linienFarbe + ":" + linienDicke + ":");
    } else if (fuellen == true) {
      background(190);
    }
  }
}


void keyPressed() {
  if (key == ENTER || key == RETURN) {
    if (!message.equals("")) {

      //nachrichten.setText(nachrichten.getText() + nickname + ": " + message + "\n");
      wsc.sendMessage("chat" + nickname + ": " + message + "\n");
      //  System.out.println(message);
    }
  }
}

//This is an event like onMouseClicked. If you chose to use it, it will be executed whenever the server sends a message 
void webSocketEvent(String msg) {
  int counter = 0;
  println(msg);
  if (msg.substring(0, 4).equals("draw")) {
    for (int i = 0; i < msg.length(); i++) {
      if (msg.charAt(i) == ':') {
        for (int j = i + 1; j < msg.length(); j++) {
          if (msg.charAt(j) == ':') {
            println("Text : " + msg.substring(i +1, j));
            mouseData[counter] = Float.parseFloat(msg.substring(i +1, j));
            counter++;
            i = j;
          }
        }
      }
    }
  } else  if (msg.substring(0, 4).equals("chat")) {
    nachrichten.setText(nachrichten.getText() + msg.substring(4, msg.length()));
  } else  if (msg.substring(0, 4).equals("scor")) {
    scoreBoard.setText("");
    for (int i = 0; i < msg.length(); i++) {
      if (msg.charAt(i) == ':') {
        for (int j = i + 1; j < msg.length(); j++) {
          if (msg.charAt(j) == ':') {
            scoreBoard.setText(scoreBoard.getText() + msg.substring(i +1, j)+"\n");

            counter++;
            i = j;
          }
        }
      }
    }
  }
}

void exit(){
wsc.sendMessage("disc"+ nickname);
super.exit();
}
