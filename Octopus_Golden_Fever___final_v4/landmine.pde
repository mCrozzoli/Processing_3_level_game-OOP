class Landmine
{
  float lMineWidth = 80;
  float lMineHeight = 80;

  float posX = (int)random(height, 200);
  float posY= (int)random(height*0.5+lMineHeight, height-lMineHeight);

  PImage landmine;
  boolean isObjectOn = true;

  Landmine()
  {
    landmine = loadImage("landmine.png");
  }

  void display(float whereX)
  {
    if (isObjectOn==true)
    {
      image(landmine, posX+whereX, posY, lMineWidth, lMineHeight);
    }
  }

  void lmcollision(float whereX, float heroX, float heroY)
  {
    if ((heroX+hero.sizeWidth >= posX+whereX && heroX <= posX+whereX+lMineWidth) &&
      (heroY+hero.sizeHeight-hero.lengthLegs >= posY && heroY+hero.sizeHeight <= posY+lMineHeight))
    {
      triggerSample();
      level.restart(); 
      currentScreen=2;
    }
  }

  void triggerSample()
  {
    soundLandMine.trigger();
  }
}
