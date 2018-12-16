public class Woerter
{
  public String[] woerterliste = {"Diamant", "Haus", "Fussball", "Apfel"};
  
  public Woerter()
  {
    
  }
  
  public String getRandomWord()
  {
    int index = int(random(woerterliste.length));
    return woerterliste[index];
  }
  
}
