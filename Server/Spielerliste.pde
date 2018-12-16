public class Spielerliste
{
  private Spieler[] spielerliste;
  private int spielerAmZug=0;
  private int index=0;
  private final int _ANZAHLSPIELER=6;

  public Spielerliste()
  {
    this.spielerliste = new Spieler[_ANZAHLSPIELER];
  }

  public void spielerHinzufuegen(Spieler x)
  {
    spielerliste[index] = x;
    index++;
  }
  
  public int anzahlSpieler(){
    int anzahl = 0;  
    for(int i = 0; i < _ANZAHLSPIELER;i++){
      if(spielerliste[i] != null){
        anzahl++;
      }
      }
    return anzahl;
  }
  
  public void spielerLoeschen(Spieler x)
  {
    for(int i = 0; i < spielerliste.length;i++){
      if(x.getName().equals(spielerliste[i].getName())){
        spielerliste[i] = null;
      }
    }
  }

  public Spieler getSpieler(int i)
  {
    return this.spielerliste[i];
  }

  public void naechsterSpieler()
  { 
    spielerAmZug++;
  }

  public int getSpielerAmZug()
  {
    return spielerAmZug;
  }

  public void setSpielerAmZug(int spieler)
  {
    this.spielerAmZug = spieler;
  }

  public Spieler getAktuellerSpieler()
  {
    return spielerliste[spielerAmZug];
  }

  public Spieler[] getSpielerliste()
  {
    return this.spielerliste;
  }
}
