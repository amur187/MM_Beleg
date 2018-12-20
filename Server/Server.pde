import controlP5.*;

import websockets.*;

WebsocketServer ws;
int now;
float x, y;
Textarea Chatverlauf;
Spielerliste spielerScoreboard = new Spielerliste();
//String[] spielerScoreBoard = new String[6];
int spielerBeigetreten = 0;

float[] mouseData = new float[6];

void setup() {
  size(600, 500);

  //Initiates the websocket server, and listens for incoming connections on ws://localhost:8025/john
  ws= new WebsocketServer(this, 8025, "/john");
  x=0;
  y=0;
  background(155);
  Spiel game = new Spiel();
  while (spielerScoreboard.anzahlSpieler() >= 0) {
    System.out.println("Spiel gestartet");
    game.spielStarten();
  }
}
void draw() {
  stroke(mouseData[4]);
  strokeWeight(mouseData[5]);
  line(mouseData[0], mouseData[1], mouseData[2], mouseData[3]);
}


//This is an event like onMouseClicked. If you chose to use it, it will be executed whenever a client sends a message
void webSocketServerEvent(String msg) {
  // println(msg);
  int counter = 0;
  if (msg.substring(0, 4).equals("draw")) {
    ws.sendMessage(msg);
    for (int i = 0; i < msg.length(); i++) {
      if (msg.charAt(i) == ':') {
        for (int j = i + 1; j < msg.length(); j++) {
          if (msg.charAt(j) == ':') {
            println("Mouse: " + msg.substring(i +1, j));
            mouseData[counter] = Float.parseFloat(msg.substring(i +1, j));
            counter++;
            i = j;
          }
        }
      }
    }
    for (int i = 0; i < mouseData.length; i++) {
      print(mouseData[i]);
    }
  } else if (msg.substring(0, 4).equals("chat")) {
    ws.sendMessage(msg);
  } else if (msg.substring(0, 4).equals("join")) {
    Spieler s = new Spieler(msg.substring(4, msg.length()));
    spielerScoreboard.spielerHinzufuegen(s);
    spielerBeigetreten++;
    spielerDatenSenden();
  } else if (msg.substring(0, 4).equals("disc")) {
    for (int i = 0; i < spielerScoreboard._ANZAHLSPIELER; i++) {
      if (msg.substring(4, msg.length()).equals(spielerScoreboard.getSpieler(i))) {
        spielerScoreboard.spielerLoeschen(spielerScoreboard.getSpieler(i));
        spielerBeigetreten--;
        spielerDatenSenden();
      }
    }
    println(spielerDaten());
  } else {
    println("elseeeee: " + msg);
  }
}




public void spielerDatenSenden() {
  ws.sendMessage(spielerDaten());
}

public String spielerDaten() {
  String rueckgabe = "scor:";
  if (spielerBeigetreten >=1) {
    for (int i = 0; i<spielerScoreboard._ANZAHLSPIELER; i++) {
      if (spielerScoreboard.getSpieler(i) != null) {
        rueckgabe += spielerScoreboard.getSpieler(i).getName() + ":";
      }
    }
  }
  return rueckgabe;
}
