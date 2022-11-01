class BulletBackward
{
  float fireX;
  float fireY = hero.posY+(hero.sizeHeight*0.3);
  float speedFire=500;
  float sizeFire=10;

  boolean isBulletBOn = true;

  int lastTick = millis();

  BulletBackward(float posX)
  {
    fireX = posX;
  }

  void display()
  {
    if (isBulletBOn == true) {
      ellipse(fireX+100, fireY, sizeFire, sizeFire);
    } else if (isBulletBOn == false) {
      fireX=10; 
      fireY=10;
    }
  }

  void update()
  {
    display();
    if (isBulletBOn == true) {
      fireX -= (speedFire*(millis()-lastTick)*0.001);
      lastTick=millis();
    }
  }

  boolean bulletBCollision()
  {
    if (fireX+sizeFire < 0) {
      isBulletBOn=false; 
      println("outB");
      return true;
    } else {
      return false;
    }
  }
}
