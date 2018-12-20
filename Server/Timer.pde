class Timer
{
  private int _SECONDS;
  private String time = String.valueOf(_SECONDS);
  private int t;
  //private int interval = _SECONDS;
      
  public Timer(int x){
   _SECONDS = x; 
  }
      
  public void resetTimer(){
        t = _SECONDS;
   }
   
  public String startTimer(){
     t = _SECONDS-int(millis()/1000);
     time= String.valueOf(t);
     return time;
  }
  
  public boolean finished(){
    if(t==0){
      this.resetTimer();
      System.out.println(t);
      return true;
    }else
      return false;
  } 
  
  public int getTime(){
    return t;
  }
}
