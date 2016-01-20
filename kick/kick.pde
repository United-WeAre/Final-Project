int headSize = 50;
int shoeW = 30;
int shoeH = 15;
float theta = 0;
float forwardKick = radians(2);
float backKick = -radians(.75);
float kick = forwardKick;
float head1y = 550;
float head1x = 650;
float player1move = 6;
float head2y = 550;
float head2x = 150;
float player2move = 6;

void setup() {
  size(800, 600);
  rectMode(CENTER);
}

void draw() {
  background(150);
  fill(255, 0, 0);
  rect(width/2, height/2, width, height);
  pushMatrix();
  translate(head1x, head1y);
  fill(255);
  ellipse(0, 0, headSize, headSize);
  rotate(theta);
  rect(0, 0 + headSize/2, shoeW, shoeH);
  theta += kick;
  if (theta > PI/2) {
    kick = backKick;
  }
  if (theta < 0) {
    kick = forwardKick;
  }
  popMatrix();
  pushMatrix();
  translate(head2x, head2y);
  fill(255);
  ellipse(0, 0, headSize, headSize);
  rotate(theta);
  rect(0, 0 + headSize/2, shoeW, shoeH);
  theta += kick;
  if (theta > PI/2) {
    kick = backKick;
  }
  if (theta < 0) {
    kick = forwardKick;
  }
  popMatrix();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == 37) {
      head1x -= player1move;
    } else if (keyCode == 39) {
      head1x += player1move;
    }
  }
  if (key == 'a') {
    head2x -= player2move;
  } else if (key == 'd') {
    head2x += player2move;
  }
  head1x = constrain(head1x, 50, width-50);
  head2x = constrain(head2x, 50, width-50);
}