public class Spiel
{   
  private int maxRunden = 3;
  private int runde = 0;
  private int anzahlSpieler = 3;
  private int letzterMaler = 0;
  private double zeitProRunde = 60;
  private String wortDerRunde;
  private boolean starten = false;
  Woerter wortliste = new Woerter();
  Spielerliste spielerliste = new Spielerliste();
  Platzierung platzierung = new Platzierung(anzahlSpieler);

  public void spielStarten()
  {
    if (genugSpieler()) {
    }
  }

  private void rundeStarten() {
  //  bestimmeMaler();
    getWortDerRunde();
    //5s Timer 

    //Haupttimer starten (spiel läuft)
  }

  private void timer() {
    //timer ablaufen lassen

    //gui repaint
    //maler werden rechte entzogen
    //punkte werden summiert
  }

  //private Spieler bestimmeMaler() {
  //  for (int i = letzterMaler; i < spielerliste.getSpielerliste().length;i++) {
  //    if (spielerliste.getSpieler(i) != null) {
  //      spielerliste.getSpieler(i).setZugTrue();
  //      return spielerliste.getSpieler(i);
  //    }
  //  }
  //}

  private boolean genugSpieler() {
    if (spielerliste.anzahlSpieler() >1) {
      return true;
    } else {
      return false;
    }
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
