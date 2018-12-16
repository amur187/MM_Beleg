public class Button {
  float _x;
  float _y;
  float _width;
  float _height;
  color _color;
  
  public Button(float x, float y, float w, float h, color c) {
    _x=x; _y=y; _width=w; _height=h;
    _color = c;
  }
  
  public void drawButton() {
    stroke(0,0,0);
    fill(_color);
    
    rect(_x,_y,_width,_height);
    textAlign(CENTER);
   
  }
  
  public boolean CheckClick() {
    return mouseX > _x && mouseX < (_x + _width) && mouseY > _y && mouseY < (_y + _height);
  }
  
  public  color getColor(){
  return _color;
}

public void mausUeberpruefen(){
  if(mousePressed){ System.out.println( this.getColor());};
}

public void mousePressed(Event e) {
  
  currentColor = buttonWeiss.getColor();
  currentColor = buttonRot.getColor();
  currentColor = buttonOrange.getColor();
  currentColor = buttonGelb.getColor();
  currentColor = buttonGruen.getColor();
  currentColor = buttonBlau.getColor();
  currentColor = buttonBraun.getColor();
  currentColor = buttonSchwarz.getColor();
  
}


  
}
