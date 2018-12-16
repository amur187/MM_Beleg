color currentColor;
int rectX,rectY;
Button buttonWeiss;
Button buttonRot;
Button buttonOrange;
Button buttonGruen;
Button buttonGelb;
Button buttonBlau;
Button buttonLila;
Button buttonBraun;
Button buttonSchwarz;


public void setup() {
  size(500,700);

ButtonLeiste bl = new ButtonLeiste();
  bl.erstellen();

};

public void draw() {
  
  background(204);
  
  // Draw Color texts
  textSize(12);
  textAlign(LEFT);
  fill(0,0,0);
  noStroke();
  text(getColor(currentColor), 190, 50); 
  rectX = 150;
  rectY = 680;
  
  // Draw Button
  buttonWeiss.drawButton();
  buttonRot.drawButton();
  buttonOrange.drawButton();
  buttonGelb.drawButton();
  buttonGruen.drawButton();
  buttonBlau.drawButton();
  buttonLila.drawButton();
  buttonBraun.drawButton();
  buttonSchwarz.drawButton();
}


void mouseClicked() {
   buttonWeiss.mausUeberpruefen();
}



public String getColor(color c){
  return "RGB ("+(int)(red(c))+", "+(int)(green(c))+", "+(int)(blue(c))+")";
}
