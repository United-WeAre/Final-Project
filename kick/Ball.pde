class Ball {
  float x;
  float y;
  float velX;
  float velY;
  int diam;
  float gravity;

  Ball() {
    x = width/2;
    y = height/2;
    diam = 40;
    velX = random(-5, 5);
    velY = random(-5, 5);
    gravity = 1;
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
    if (y + diam/2 > height) {
      velY = -abs(velY);
    }
    if (y>= height) {
      y = height - diam/2;
    }
  }
}