class Ball {
  float x;
  float y;
  float velX;
  float velY;
  int diam;
  float gravity;
  int scoreL;
  int scoreR;

  Ball() {
    x = width/2;
    y = height/2;
    diam = 40;
    velX = random(-5, 5);
    velY = random(-5, 5);
    gravity = 1;
    scoreL = 0;
    scoreR = 0;
  }
  void display() {
    //fill(0, 0, 255);
    ellipse(x, y, diam, diam);
  }
  void move() {
    x += velX;
    velY= velY + gravity;
    y += velY;

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
    fill(255);
    textSize(75);
    text(scoreL, 470, 225);
    if (x + diam <= 200) {
      scoreL = scoreL + 1;
    }
    text(scoreR, 710, 225);
    if (x + diam >= 1150) {
      scoreR = scoreR + 1;
    }
  }
}