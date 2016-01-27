int headSize = 50;
int shoeW = 30;
int shoeH = 60;
float theta1 = 0;
float theta2 = 0;
float forwardKick = radians(2);
float backKick = -radians(.75);
float kick = forwardKick;
float forwardKick2 = radians(2);
float backKick2 = -radians(.75);
float kick2 = forwardKick2;
float head1y = 550;
float head1x = 650;
float player1move = 6;
float head2y = 550;
float head2x = 150;
float player2move = 6;
boolean kickactivate1 = false;
boolean kickactivate2 = false;
//PImage Ball2 = loadImage("Ball2.jpg");
Ball b = new Ball();
void setup() {
  size(1280, 720);        //creates size of canvas
  rectMode(CENTER);
  //Ball2 = loadImage("Ball2.jpg");
}

void draw() {
  b.display();
  b.move();
  println("kick1: " + kickactivate1);
  background(150);
  fill(255, 0, 0);
  rect(width/2, height/2, width, height);
  pushMatrix();
  translate(head1x, head1y);
  fill(255);
  ellipse(0, 0, headSize, headSize);

  if (kickactivate1==true) {
    rotate(theta1);
    theta1 += kick;
  }
  //rotate(theta1);
  rect(0, 0 + headSize/2, shoeW, shoeH);
  if (kickactivate1==true && theta1 > PI/2) {
    kick = backKick;
  }
  if (kickactivate1==true && theta1 < 0) {
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
  //rotate(theta1);

  rect(0, 0 + headSize/2, shoeW, shoeH);
  rotate(-theta2);


  if (kickactivate2==true && theta2 > PI/2) {
    kick2 = backKick2;
  }
  if (kickactivate2==true && theta2 < 0) {
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

  head1x = constrain(head1x, 50, width-50);
  head2x = constrain(head2x, 50, width-50);
}

void keyReleased () { 
  if (keyCode == 32) {
    kickactivate1=false;
  }
  if (key == 'l') {

    kickactivate2=false;
  }
}