public class Spiel
{   
  private int maxRunden = 3;
  private int runde = 0;
  private int anzahlSpieler = 3;
  private double zeitProRunde = 60;
  private String wortDerRunde;
  private boolean starten = false;
  Woerter wortliste = new Woerter();
  Spielerliste spielerliste = new Spielerliste();
  Platzierung platzierung = new Platzierung(anzahlSpieler);

  public void spielStarten()
  {
    starten = true;
    spielerliste.setSpielerAmZug(0);
    this.runde = 1;
    spielerliste.getSpieler(0).setZugTrue();
  }

  public void naechsteRunde()
  {
    spielerliste.setSpielerAmZug(0);
    runde++;
    getWortDerRunde();
  }

  void spielerWechsel()
  {
    spielerliste.getAktuellerSpieler().setZugFalse();
    spielerliste.naechsterSpieler();
    spielerliste.getAktuellerSpieler().setZugTrue();
    getWortDerRunde();
  }

  String getWortDerRunde()
  {
    this.wortDerRunde = wortliste.getRandomWord();
    return this.wortDerRunde;
  }

  boolean zeitAbgelaufen()
  {
    if (zeitProRunde == 0)
    {
      return true;
    }
    return false;
  }

  void spielerFertig()
  {
    //wenn spieler erraten hat - kommt in platzierung rein
  }

  void spielBeenden()
  {
    if (runde == maxRunden)
    {
    }
  }

  int getRunde()
  {
    return runde;
  }

  //void getAktuellerSpielerAmZug()
  //{
  //  spielerliste.getAktuellerSpieler();
  //}
}
