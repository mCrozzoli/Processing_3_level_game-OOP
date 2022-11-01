/* The Octopus' Golden Fever
Programming for Designers > Sep2020
coded by Eskil Riskær and Miguel Angel Crozzoli (feb 2021)

Instructions.
JukeBox > gives you energy
Enemies > you loose energy if they are on screen
Landmines > touch them and you die!
to shoot use "a" and "s"
*/

float dropEnergy = 0.1; //change it! if it's too difficult...

import ddf.minim.*;
Minim minim;

int durationOneFrame = 100;
int frame = 0;
int frameMax = 8;
float fSpeed;
float energy;
int score;
boolean scoreOff = true;
PFont f;
Level level;
Hero hero;
Scene scene;
HighScore hScore;
ArrayList <BulletForward> bulletsF;
ArrayList <BulletBackward> bulletsB;
SoundObject[] sObject;
Enemy[] enemy;
Landmine[] landmine;
Power[] power;
boolean gameStarted = false;
int currentScreen;
int choosenLevel = 0;
AudioSample soundsLevel;
AudioSample soundEnemy;
AudioSample soundCassette;
AudioSample soundJukebox;
AudioSample soundLandMine;

PImage openScreen;

void setup()
{
  size(1000, 800);
  f = createFont("Arial", 16);
  textFont(f);
  hero = new Hero();
  level = new Level();
  hScore = new HighScore();
  minim = new Minim(this);
  currentScreen = 0;
  soundEnemy = minim.loadSample("soundEnemy6.mp3");
  soundCassette = minim.loadSample("soundCassette.mp3");
  soundJukebox = minim.loadSample("soundJukebox.mp3");
  soundLandMine = minim.loadSample("soundLandMine.mp3");
  openScreen = loadImage("openScreen.png");
}

void draw() 
{
  background(0);

  if (currentScreen == 0)
  {
    scoreOff = true;
    titleScreen();
  } else if (currentScreen == 1)
  {
    scoreOff = true;
    gameScreenDisplay();
    gameScreenUpdate();
  } else if (currentScreen == 2)
  {
    scoreOff = false;
    gameOverScreen();
  }
}

void keyPressed()
{
  if (scoreOff == true) {
    if (key == CODED) 
    {
      if (keyCode == LEFT) 
      {
        hero.keyPressedLeft();
      } else if (keyCode == RIGHT) 
      {
        hero.keyPressedRight();
      }
      if (keyCode == UP) 
      {
        hero.keyPressedUp();
      }
      if (keyCode == DOWN) 
      {
        hero.keyPressedDown();
      }
    } else 
    {
      if (key == 'a'||key == 'A') 
      {
        hero.keyPressedFireBackward();
      }
      if (key == 's'||key == 'S') 
      {
        hero.keyPressedFireForward();
      }
    }
    if (key == ' ')
    {
      if (currentScreen == 0)
      {
        currentScreen = 1;
      } else if (currentScreen == 2)
      {
        currentScreen = 0;
      }
    }
  } else if (scoreOff == false) {
    hScore.keyPressed();
  }
}

void keyReleased()
{
  if (key == CODED) 
  {
    if (keyCode == LEFT) 
    {
      hero.keyReleasedLeft();
    } else if (keyCode == RIGHT) 
    {
      hero.keyReleasedRight();
    }
    if (keyCode == UP) 
    {
      hero.keyReleasedUp();
    }
    if (keyCode == DOWN) 
    {
      hero.keyReleasedDown();
    }
  } else 
  {
    if (key == 'a'||key == 'A') 
    {
      hero.keyReleasedFireBackward();
    }
    if (key == 's'||key == 'S') 
    {
      hero.keyReleasedFireForward();
    }
  }
}

void titleScreen()
{
  gameStarted = false;
  image(openScreen, 0, 0);
  hScore.showScore();
  fSpeed = -100;
  energy = 100;
  score = 0;
  level.levelSelector(0);
}

void gameScreenDisplay()
{
  background(145, 199, 177);
  fill(255);
  level.display();
  hero.display(frame*100);
  textSize(40);
  text("LIFE " + int(energy), 100, 40);
  fill(67);
  text("|| score " + int(score), 280, 40);
}

void gameScreenUpdate()
{
  level.update();
  hero.update();
}

void gameOverScreen()
{
  gameStarted = false;
  background(0);  
  hScore.update();
  textAlign(CENTER);
  fill(84, 73, 75);
  textSize(28);
  text("END OF YOUR GAME <3", 200, 50);
  textSize(18);
  text("write your name and press ENTER to ink away!", 200, 140);
}

void startGame()
{
  if (gameStarted == false) {
    gameStarted = true;
  }
}
