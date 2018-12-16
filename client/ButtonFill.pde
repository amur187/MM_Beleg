public class ButtonFill{
color currentColor;

Button[] buttons;

public ButtonFill(){
  buttonsDraw();
}

public void buttons() {
  buttons = new Button [9];
  buttons[0] = new Button(X_POS, Y_POS, BUTTON_HOEHE, BUTTON_HOEHE,SCHWARZ );  
  buttons[1] = new Button(X_POS + SPACER,Y_POS,BUTTON_BREITE,BUTTON_HOEHE,WEISS);
  buttons[2] = new Button(X_POS + SPACER + SPACER,Y_POS,BUTTON_BREITE,BUTTON_HOEHE,GRUEN);
  buttons[3] =  new Button(X_POS + SPACER + SPACER + SPACER,Y_POS,BUTTON_BREITE,BUTTON_HOEHE,GELB);
  buttons[4] = new Button(X_POS + SPACER + SPACER + SPACER + SPACER,Y_POS,BUTTON_BREITE,BUTTON_HOEHE,ROT);
  buttons[5] = new Button(X_POS + SPACER + SPACER + SPACER + SPACER + SPACER ,Y_POS,BUTTON_BREITE,BUTTON_HOEHE,MAGENTA);
  buttons[6] =  new Button(X_POS + SPACER + SPACER + SPACER + SPACER + SPACER + SPACER,Y_POS,BUTTON_BREITE,BUTTON_HOEHE,BLAU);
  buttons[7] = new Button(X_POS + SPACER + SPACER + SPACER + SPACER + SPACER + SPACER + SPACER,Y_POS,BUTTON_BREITE,BUTTON_HOEHE,CYAN);
  buttons[8] =  new Button(X_POS + SPACER + SPACER + SPACER + SPACER + SPACER  + SPACER + SPACER + SPACER,Y_POS,BUTTON_BREITE,BUTTON_HOEHE,BRAUN);
};

public void buttonsDraw(){
  buttons();
  for(int i = 0; i<buttons.length; i++){
    buttons[i].drawButton();}
}

public color checkColor(){
for(int i = 0; i < buttons.length;i++){
  if(buttons[i].CheckClick()){
     return (color) buttons[i].getColor();
  }
}
  return currentColor;
}




public String getColor(color c){
  return "RGB ("+(int)(red(c))+", "+(int)(green(c))+", "+(int)(blue(c))+")";
}}
