class Spark //from lecture-material, week 39, code 4
{
  float posX = 0;
  float posY = 0;
  float velocityX = 0;
  float velocityY = 0;
  color c=color(int(random(128, 256)), int(random(128, 256)), int(random(128, 256)));
  float gravity = 0.1;

  Spark(float x, float y, float vX, float vY)
  {
    posX = x;
    posY = y;
    velocityX = vX;
    velocityY = vY;
  }

  void display()
  {
    strokeWeight(6);
    stroke(c);
    point(posX, posY);
  }

  void update()
  {
    posX += velocityX;
    posY += velocityY;
    velocityY += gravity;
  }
}
