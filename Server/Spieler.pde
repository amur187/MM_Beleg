
public class Spieler
{
  
  private String name;
  private boolean zug;
  private boolean erraten;
  private int punkte;
  //private int nummer;

  Spieler(String name)
  {
     this.name = name;
     this.zug = false;
     this.erraten = false;
     this.punkte = 0;
  }
  
  String getName()
  {
    return this.name;
  }  
  
  int getPunkte()
  {
    return this.punkte;
  }
  
  void setZugTrue()
  {
    this.zug = true;
  }
  
  void setZugFalse()
  {
   this.zug = false; 
  }
  
  boolean istAmZug()
  {
    return this.zug;
  }
  
  void setErratenTrue()
  {
   this.erraten=true; 
  }
  
  void setErratenFalse()
  {
    this.erraten=false; 
  }
  
  boolean hatErraten()
  {
   return this.erraten;
  }
  
}
