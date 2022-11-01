class Enemy
{
  float posX=0;
  float posY=height*0.5;
  float sizeHeight = 70;
  float sizeWidth = 70;

  float speed = 0.5;
  float deltaX;
  float deltaY;
  int hit = 0;

  String[] imageNamesEnemy;
  PImage[] enemy;

  boolean isDead = false;

  int lastTick = millis();

  Enemy(float whereX)
  {
    posX = whereX;

    String[] imageNamesEnemy = {"enemy1.png", "enemy2.png", "enemy3.png"};
    enemy = new PImage[imageNamesEnemy.length];
    for (int i=0; i < imageNamesEnemy.length; i++) 
    {
      String imageName = imageNamesEnemy[i];
      enemy[i] = loadImage(imageName);
    }
  }

  void display(float offSet, int levelID)
  {
    if (isDead == false) {
      if (levelID == 0) {
        image(enemy[0], posX + offSet, posY, sizeHeight, sizeWidth);
      } else if (levelID == 1) {
        image(enemy[1], posX + offSet, posY, sizeHeight, sizeWidth);
      } else if (levelID == 2) {
        image(enemy[2], posX + offSet, posY, sizeHeight, sizeWidth);
      }
    } else if (isDead == true) {
      posX = -10;
      posY = 0;
    }
  }

  void update(float offSet)
  {
    if (isDead==false && (posX+offSet)-hero.posX <= width) {
      float[] target = {hero.posX, hero.posY};
      float[] delta = {(target[0]-(posX+offSet)), (target[1]-posY)};
      posX += (delta[0] * speed * (millis()-lastTick)*0.001) + random(-5, 5); // "+ random(-5,5)" is used to try to fix the move towards the graphical clumping  
      posY += (delta[1] * speed * (millis()-lastTick)*0.001) + random(-5, 5); // together and eventually fusing together of the enemies. Does it work?!
      triggerSample();
    }

    lastTick=millis();
  }

  void enemyKilled(float offSet, int levelID)
  {
    for (int i = bulletsF.size()-1; i>=0; i--) 
    {
      BulletForward currF = bulletsF.get(i); 

      if ((currF.fireX+currF.sizeFire > posX+offSet && currF.fireX <= posX+sizeWidth+offSet) &&
        (currF.fireY+currF.sizeFire > posY && currF.fireY <= posY+sizeHeight))
      {
        hit++;
        if (levelID==0 && hit==1) {
          isDead=true;
          score += 20;
          hit=0;
        } else if (levelID==1 && hit==2) {
          isDead=true;
          score += 30;
          hit=0;
        } else if (levelID==2 && hit==3) {
          isDead=true;
          score += 40;
          hit=0;
        }
        bulletsF.remove(i);
      }
    }

    {
      for (int j = bulletsB.size()-1; j>=0; j--) 
      {  
        BulletBackward currB = bulletsB.get(j);
        if ((currB.fireX+currB.sizeFire > posX+offSet && currB.fireX <= posX+sizeWidth+offSet) &&
          (currB.fireY+currB.sizeFire > posY && currB.fireY <= posY+sizeHeight))
        {
          hit++;
          if (levelID==0 && hit==1) {
            isDead=true;
            score += 20;
            hit=0;
          } else if (levelID==1 && hit==2) {
            isDead=true;
            score += 30;
            hit=0;
          } else if (levelID==2 && hit==3) {
            isDead=true;
            score += 40;
            hit=0;
          }
          bulletsB.remove(j);
        }
      }
    }
  }

  void powerDown(float offSet)
  {
    if (posX+offSet > 0 && posX+offSet <width)
    {  
      energy = energy - dropEnergy;
      if (energy <0) {
        level.restart(); 
        currentScreen=2;
      }
    }
  }

  void triggerSample()
  {
    soundEnemy.trigger();
  }
}
