public class Platzierung
{
  Spieler[] platzierung;
  int anzahlSpieler;
  int schonFertig = 0;

  public Platzierung(int anzahlSpieler)
  {
    this.anzahlSpieler = anzahlSpieler;
    platzierung = new Spieler[anzahlSpieler];
  }

  void spielerFertig(Spieler x)
  {
    platzierung[schonFertig] = x;
    schonFertig++;
  }

  void platzierungResetten()
  {
    platzierung = new Spieler[anzahlSpieler]; 
    schonFertig = 0;
  }
}
