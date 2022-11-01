class Level
{
  float fOffsetX = 0;
  float fOffsetXEnemy = 0;
  int iTicksLast = 0;

  String[] lines1;
  String[] lines2;
  String[] lines3;
  String[] level;
  int levelId;

  Level()
  {
    scene = new Scene();
    sObject = new SoundObject[12];
    enemy = new Enemy[12];
    landmine = new Landmine[12];
    power = new Power[12];
    lines1 = loadStrings("level1.txt");
    lines2 = loadStrings("level2.txt");
    lines3 = loadStrings("level3.txt");
    iTicksLast = millis();
  }

  void display()
  {  
    for (int j = 0; j < level.length; j++)
    {
      for (int i = 0; i < level[j].length(); i++) 
      {
        if (level[j].charAt(i) == '1') {
          scene.display(0, fOffsetX+500*i, levelId);
        } else if (level[j].charAt(i) == '2') {
          scene.display(1, fOffsetX+500*i, levelId);
        } else if (level[j].charAt(i) == '3') {
          scene.display(2, fOffsetX+500*i, levelId);
        } else if (level[j].charAt(i) == '4') {
          scene.display(3, fOffsetX+500*i, levelId);
        } else if (level[j].charAt(i) == '5') {
          scene.display(4, fOffsetX+500*i, levelId);
        } else if (level[j].charAt(i) == '6') {
          scene.display(5, fOffsetX+500*i, levelId);
          if (fOffsetX+500*i<0) {
            fSpeed=0;
          }
          if (fOffsetX+500*i<0 && hero.posX+hero.sizeWidth >= width) {
            nextLevel();
          }
        } 
        if (level[j].charAt(i) == 'C') {
          sObject[i].display(fOffsetX+500*i);
        } 
        if (level[j].charAt(i) == 'L') {
          landmine[i].display(fOffsetX+500*i);
        }
        if (level[j].charAt(i) == 'E') {
          enemy[i].display(fOffsetX, levelId);
        } 
        if (level[j].charAt(i) == 'P') {
          power[i].display(fOffsetX);
        }
      }
    }
  }

  void update()
  {
    int delta = millis() - iTicksLast;
    fOffsetX += fSpeed * delta * 0.001;
    iTicksLast += delta;

    for (int j = 0; j < level.length; j++)
    {
      for (int i = 0; i < level[j].length(); i++)
      {
        if (level[j].charAt(i) == 'C') 
        {
          sObject[i].objectCollected(fOffsetX+500*i, hero.posX, hero.posY);
        }
      }
    }


    for (int j = 0; j < level.length; j++)
    {
      for (int i = 0; i < level[j].length(); i++)
      {
        if (level[j].charAt(i) == 'L') 
        {
          landmine[i].lmcollision(fOffsetX+500*i, hero.posX, hero.posY);
        }
      }
    }    

    for (int j = 0; j < level.length; j++)
    {
      for (int i = 0; i < level[j].length(); i++)
      {
        if (level[j].charAt(i) == 'E')
        {
          enemy[i].update(fOffsetX);
          enemy[i].enemyKilled(fOffsetX, levelId);
          enemy[i].powerDown(fOffsetX);
        }
      }
    }               

    for (int j = 0; j < level.length; j++)
    {
      for (int i = 0; i < level[j].length(); i++)
      {
        if (level[j].charAt(i) == 'P')
        {
          power[i].powerUp(fOffsetX);
          power[i].sparksFire();
        }
      }
    }
  }

  void levelSelector(int levelID)
  {
    if (levelID==0) {
      level=lines1;
      levelId=0;
      for (int j = 0; j < lines1.length; j++)
      {
        for (int i = 0; i < lines1[j].length(); i++)
        {
          if (lines1[j].charAt(i) == 'C') 
          {
            sObject[i] = new SoundObject();
          }
        }
      }

      for (int j = 0; j < lines1.length; j++)
      {
        for (int i = 0; i < lines1[j].length(); i++)
        {
          if (lines1[j].charAt(i) == 'L') 
          {
            landmine[i] = new Landmine();
          }
        }
      }

      for (int j = 0; j < lines1.length; j++)
      {
        for (int i = 0; i < lines1[j].length(); i++)
        {
          if (lines1[j].charAt(i) == 'E') 
          {
            enemy[i] = new Enemy(1000*i);
          }
        }
      }

      for (int j = 0; j < lines1.length; j++)
      {
        for (int i = 0; i < lines1[j].length(); i++)
        {
          if (lines1[j].charAt(i) == 'P') 
          {
            power[i] = new Power(500*i);
          }
        }
      }
    } else if (levelID==1) {
      level=lines2;
      levelId=1;
      for (int j = 0; j < lines2.length; j++)
      {
        for (int i = 0; i < lines2[j].length(); i++)
        {
          if (lines2[j].charAt(i) == 'C') 
          {
            sObject[i] = new SoundObject();
          }
        }
      }

      for (int j = 0; j < lines2.length; j++)
      {
        for (int i = 0; i < lines2[j].length(); i++)
        {
          if (lines2[j].charAt(i) == 'L') 
          {
            landmine[i] = new Landmine();
          }
        }
      }

      for (int j = 0; j < lines2.length; j++)
      {
        for (int i = 0; i < lines2[j].length(); i++)
        {
          if (lines2[j].charAt(i) == 'E') 
          {
            enemy[i] = new Enemy(500*i);
          }
        }
      }

      for (int j = 0; j < lines2.length; j++)
      {
        for (int i = 0; i < lines2[j].length(); i++)
        {
          if (lines2[j].charAt(i) == 'P') 
          {
            power[i] = new Power(500*i);
          }
        }
      }
    } else if (levelID==2) {
      level=lines3;
      levelId=2;
      for (int j = 0; j < lines3.length; j++)
      {
        for (int i = 0; i < lines3[j].length(); i++)
        {
          if (lines3[j].charAt(i) == 'C') 
          {
            sObject[i] = new SoundObject();
          }
        }
      }

      for (int j = 0; j < lines2.length; j++)
      {
        for (int i = 0; i < lines2[j].length(); i++)
        {
          if (lines3[j].charAt(i) == 'L') 
          {
            landmine[i] = new Landmine();
          }
        }
      }

      for (int j = 0; j < lines3.length; j++)
      {
        for (int i = 0; i < lines3[j].length(); i++)
        {
          if (lines3[j].charAt(i) == 'E') 
          {
            enemy[i] = new Enemy(random(300, 500)*i);
          }
        }
      }

      for (int j = 0; j < lines3.length; j++)
      {
        for (int i = 0; i < lines3[j].length(); i++)
        {
          if (lines3[j].charAt(i) == 'P') 
          {
            power[i] = new Power(500*i);
          }
        }
      }
    } else if (levelID>=3) {
      restart();
    }
  }

  void restart()
  {
    currentScreen=2; 
    hero.posX = 0;
    fOffsetX = 0;
  }

  void nextLevel()
  {
    levelId ++;
    hero.posX = 0;
    fOffsetX = 0;
    levelSelector(levelId);
    fSpeed = -100;
  }
}
