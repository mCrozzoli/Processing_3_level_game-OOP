class SoundObject
{
  float sObjectWidth = 70;
  float sObjectHeight = 50;

  float posX= (int)random(200, width);
  float posY= (int)random(height*0.5+sObjectHeight, height-sObjectHeight);

  PImage cassette;
  boolean isObjectOn = true;

  SoundObject()
  {
    cassette = loadImage("cassette.png");
  }

  void display(float whereX)
  {
    if (isObjectOn==true)
    {
      image(cassette, posX+whereX, posY, sObjectWidth, sObjectHeight);
    }
  }

  void objectCollected(float whereX, float heroX, float heroY)
  {
    if ((heroX+hero.sizeWidth >= posX+whereX && heroX <= posX+whereX+sObjectWidth) &&
      (heroY+hero.sizeHeight-hero.lengthLegs >= posY && heroY+hero.sizeHeight <= posY+sObjectHeight))
    {
      triggerSample();
      score += 50; 
      posX=0;
      isObjectOn = false;
    }
  }
  
    void triggerSample()
  {
    soundCassette.trigger();
  }
}
