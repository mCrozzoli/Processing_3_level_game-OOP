class Hero
{
  float posX= 15;
  float posY= height * 0.5 + 50;
  int sizeWidth = 100;
  int sizeHeight = 150;
  int lengthLegs = 40;
  float speed = 200;
  int bulletTime=0;

  boolean keyPressedLeft = false;
  boolean keyPressedRight = false;
  boolean keyPressedUp = false;
  boolean keyPressedDown = false;
  boolean keyPressedFireForward = false;
  boolean keyPressedFireBackward = false;

  int lastTick = millis();

  PImage spriteSheet;

  Hero()
  {
    bulletsF = new ArrayList();
    bulletsB = new ArrayList();
    spriteSheet = loadImage("walkingHero.png");
  }

  void display(int x)
  {
    PImage heroImg = spriteSheet.get(x, 0, sizeWidth, sizeHeight);
    image(heroImg, posX, posY, sizeWidth, sizeHeight);
  }

  void update()
  {
    if (keyPressedLeft== true) {
      posX -= speed*((millis()-lastTick)*0.001);
      frame++;
      if (frame >= frameMax) {
        frame=0;
      }
    }
    if (keyPressedRight== true) {
      posX += speed*((millis()-lastTick)*0.001);
      frame++;
      if (frame >= frameMax) {
        frame=0;
      }
    }
    if (keyPressedUp== true) {
      posY -= speed*((millis()-lastTick)*0.001);
      frame++;
      if (frame >= frameMax) {
        frame=0;
      }
    }
    if (keyPressedDown== true) {
      posY += speed*((millis()-lastTick)*0.001);
      frame++;
      if (frame >= frameMax) {
        frame=0;
      }
    }

    if (keyPressedFireForward == true) {
      fireF();
    }
    updateBulletsF();
    deleteBulletF();
    
    if (keyPressedFireBackward == true) {
      fireB();
    }
    updateBulletsB();
    deleteBulletB();

    if (posY<=height*0.5-(sizeHeight-lengthLegs)) {
      posY=height*0.5-(sizeHeight-lengthLegs);
    }
    if (posY+sizeHeight>height) {
      posY=height-sizeHeight;
    }
    if (posX<0) {
      posX=0;
    }
    if (posX>width-sizeWidth) {
      posX=width-sizeWidth;
    }

    lastTick=millis();
  }

  void fireF()
  {
    if (millis() - bulletTime >= 500) {
      BulletForward temp = new BulletForward(hero.posX+hero.sizeWidth);
      bulletsF.add(temp);
      bulletTime = millis();
    }
  }

  void fireB()
  {
    if (millis() - bulletTime >= 500) {
      BulletBackward temp = new BulletBackward(hero.posX-hero.sizeWidth);
      bulletsB.add(temp);
      bulletTime = millis();
    }
  }

  void updateBulletsF()
  {
    for (BulletForward temp : bulletsF) {
      temp.update();
      temp.bulletCollision();
    }
  }
  
  void updateBulletsB()
  {
    for (BulletBackward temp : bulletsB) {
      temp.update();
      temp.bulletBCollision();
    }
  }


  void deleteBulletF()
  {
    for (int i = bulletsF.size()-1; i>=0; i--) {
      BulletForward curr = bulletsF.get(i);
      if ( curr.bulletCollision()) {
        bulletsF.remove(i);
      }
    }
  }
  
  void deleteBulletB()
  {
    for (int i = bulletsB.size()-1; i>=0; i--) {
      BulletBackward curr = bulletsB.get(i);
      if ( curr.bulletBCollision()) {
        bulletsB.remove(i);
      }
    }
  }

  void keyPressedLeft() { 
    keyPressedLeft = true;
  }
  void keyReleasedLeft() { 
    keyPressedLeft = false;
  }

  void keyPressedRight() { 
    keyPressedRight = true;
  }
  void keyReleasedRight() { 
    keyPressedRight = false;
  }

  void keyPressedUp() { 
    keyPressedUp= true;
  }
  void keyReleasedUp() { 
    keyPressedUp = false;
  }

  void keyPressedDown() { 
    keyPressedDown = true;
  }
  void keyReleasedDown() { 
    keyPressedDown = false;
  }

  void keyPressedFireForward() { 
    keyPressedFireForward = true;
  }
  void keyReleasedFireForward() { 
    keyPressedFireForward = false;
  }

  void keyPressedFireBackward() { 
    keyPressedFireBackward = true;
  }
  void keyReleasedFireBackward() { 
    keyPressedFireBackward = false;
  }

}
