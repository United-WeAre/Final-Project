int headSize = 70;
int shoeW = 30;
int shoeH = 80;
float theta1 = 0;
float theta2 = 0;
float forwardKick = radians(8);
float backKick = -radians(6);
float kick = forwardKick;
float forwardKick2 = radians(8);
float backKick2 = -radians(6);
float kick2 = forwardKick2;
float head1y = 600;
float head1x = 1200;
float player1move = 10;
float head2y = 600;
float head2x = 150;
float player2move = 10;
float player1jump = 30;
float player2jump = 30;
boolean kickactivate1 = false;
boolean kickactivate2 = false;
PImage miamiArena;

void setup() {
  size(1600, 800);
  rectMode(CENTER);
  miamiArena = loadImage("miamiArena.jpg");
}

void draw() {
  miamiArena.resize(width, height);
  background(miamiArena);
  println("kick1: " + kickactivate1);
  
  pushMatrix();
  translate(head1x, head1y);
  fill(255);
  ellipse(0, 0, headSize, headSize);
  if (kickactivate1==true) {
    rotate(theta1);
    theta1 += kick;
  }
  rect(0, 0 + headSize/2, shoeW, shoeH);
  if (kickactivate1==true && theta1 >= PI/2) {
    kick = backKick;
  }
  if (kickactivate1==true && theta1 <= 0) {
    kick = forwardKick;
  }
  popMatrix();
  pushMatrix();
  translate(head2x, head2y);
  fill(255);
  ellipse(0, 0, headSize, headSize);
  if (kickactivate2==true) {
    rotate(-theta2);
    theta2 += kick2;
  }
  rect(0, 0 + headSize/2, shoeW, shoeH);
  rotate(-theta2);
  if (kickactivate2==true && theta2 >= PI/2) {
    kick2 = backKick2;
  }
  if (kickactivate2==true && theta2 <= 0) {
    kick2 = forwardKick2;
  }
  popMatrix();
}

void keyPressed() {
  if (keyCode == LEFT) {
    head1x -= player1move;
  } else if (keyCode == 39) {
    head1x += player1move;
  }
  if (keyCode == 65) {
    head2x -= player1move;
  } else if (keyCode == 68) {
    head2x += player1move;
  }
  if (keyCode == 32) {
    println("activated kick1 in frame " + frameCount);
    kickactivate1=true;
  }
  if (key == 'l') {
    println("activated kick1 in frame " + frameCount);
    kickactivate2=true;
  }
  if (keyCode == UP) {
    head1y -= player1jump;
  }
  if (key == 'w') {
    head2y -= player2jump;
  }
  head1x = constrain(head1x, 50, width-50);
  head2x = constrain(head2x, 50, width-50);
  head1y = constrain(head1y, 530, 610);
  head2y = constrain(head2y, 530, 610);
}

void keyReleased () { 
  if (keyCode == 32) {
    kickactivate1=false;
    theta1=0;
  }
  if (key == 'l') {
    kickactivate2=false;
    theta2=0;
  }
  if (keyCode == UP) {
    head1y = 600;
  }
  if (key == 'w') {
    head2y = 600;
  }
}