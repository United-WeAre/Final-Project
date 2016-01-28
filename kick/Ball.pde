//This is the class for the ball
class Ball {
  float x;
  float y;
  float velX;
  float velY;
  int diam;
  float gravity;
  int scoreL;
  int scoreR;
  PImage bola;
  // initializes variables
  Ball() {
    x = width/2;
    y = height/2;
    diam = 40;
    velX = random(-5, 5);
    velY = random(-5, 5);
    gravity = 1;
    scoreL = 0;
    scoreR = 0;
    bola = loadImage("bola.jpg");
    //gives values to variables
  }

  void display() {
    ellipse(x, y, diam, diam); // draws an ellipse
    image(bola, x-19, y-20, diam+7, diam+7); //puts the image in
  }
  void move() {
    x += velX; //adds velocity
    velY= velY + gravity; // adds gravity
    y += velY; //adds velocity

    if (x+ diam >= width) {
      velX = -abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x - diam <= 0) {
      velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y + diam/2 > height - 75) {
      velY = -abs(velY);
    }
    if (y>=  height) {
      y = height - diam/2;
    }
    //The following code controls the left and right player scores
    fill(255);
    textSize(75);
    text(scoreL, 470, 225);
    if (x + diam <= 200) { // if the ball goes past this
      scoreL = scoreL + 1; // add one to score
      x = width/2;
      y = height/2;
      velX = random(-5, 5);
      velY = random(-5, 5);
      gravity = 1;
      // resets it
    }
    text(scoreR, 710, 225);
    if (x + diam >= 1150) {  // if the ball goes past this
      scoreR = scoreR + 1; // add one to score
      x = width/2;
      y = height/2;
      velX = random(-5, 5);
      velY = random(-5, 5);
      gravity = 1;
      // resets it
    }
  }
  void collision (float sx, float sy) {

    if (dist(x, y, sx, sy) <=40) { // if it is less than 40 pixels away
      println("collide in frame " + frameCount);
      velX += random (1, 4); 
      velX=-velX;
      velY += random (1, 4); 
      velY =- abs(velY);
    }
  }
}