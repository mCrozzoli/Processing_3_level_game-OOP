class BulletForward
{
  float fireX;
  float fireY = hero.posY+(hero.sizeHeight*0.3);
  float speedFire=500;
  float sizeFire=10;

  boolean isBulletOn = true;

  int lastTick = millis();

  BulletForward(float posX)
  {
    fireX = posX;
  }

  void display()
  {
    if (isBulletOn == true) {
      ellipse(fireX, fireY, sizeFire, sizeFire);
    } else if (isBulletOn == false) {
      fireX=10; 
      fireY=10;
    } 
  }

  void update()
  {
    display();
    if (isBulletOn == true) {
      fireX += speedFire*(millis()-lastTick)*0.001;
      lastTick=millis();
    }
  }

  boolean bulletCollision()
  {
    if (fireX+sizeFire>width) {
      isBulletOn=false; 
      println("outF");
      return true;
    } else {
      return false;
    }
  }
}
