float x, y, velX, velY, diam, gravity;
PImage Ball2;


void setup()
{
  size (1600, 800);
  background (0);
  x = width/2;
  y = height/2;
  diam = 80;
  velX = random(-5, 5);
  velY = random(-5, 5);
  gravity = 1;
  Ball2 = loadImage("Ball2.jpg");
}

void draw() {

  imageMode(CENTER);
  image(Ball2, x, y);  //soccerball image inserted

  x += velX;
  velY= velY + gravity;
  y += velY;

  if (x+ diam >= width) {
    velX = -abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x - diam <= 0) {
    velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y + diam/2 > height) {
    velY = -abs(velY);
  }
  if (y>= height) {
    y = height - diam/2;
  }
}