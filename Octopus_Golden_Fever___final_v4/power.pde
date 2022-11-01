class Power
{
  float sizeWidth=66;
  float sizeHeight=95;
  float posX = (int)random(0, width*0.5);
  float posY = height*0.5-sizeHeight+5;
  PImage powerBox;

  Spark[] sparks;
  boolean sparksOn = false;
  int sparksCount = -1;


  Power(float whereX)
  {
    powerBox = loadImage("jukebox.png");
    posX = whereX;

    sparks = new Spark[300];
    for (int i=0; i>sparks.length; i++)
    {
      sparks[i] = new Spark(posX, posY, 1, 1);
    }
  }

  void display(float whereX)
  {
    image(powerBox, posX+whereX, posY);
  }

  void powerUp(float whereX)
  {
    if ((hero.posX+hero.sizeWidth >= posX+whereX && hero.posX < posX+whereX+sizeWidth) &&
      (hero.posY+hero.sizeHeight-hero.lengthLegs <= posY+sizeHeight))
    {
      sparksOn = true;
      triggerSample();
      energy++;
      if (energy >100) 
      {
        energy=100;
      }
    }
  }

  void sparksFire()
  {
    if (sparksOn == true) {

      if (sparksCount == -1) {
        for (int i = 0; i < sparks.length; i++) {
          sparks[i] = new Spark(hero.posX+50, hero.posY, random(-9, 9), random(-15, 0));
        }
      }
      if (sparksCount < 100) {
        sparksCount++;
        for (int i = 0; i < sparks.length; i++) {
          sparks[i].display();
          sparks[i].update();
        }
      }
    }
  }
  
    void triggerSample()
  {
    soundJukebox.trigger();
  }

}
