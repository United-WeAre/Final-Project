int headSize = 50;
int shoeW = 30;
int shoeH = 15;
float theta = 0;
float forwardKick = radians(1);
float backKick = -radians(.25);
float kick = forwardKick;

void setup() {
  size(800, 600);
  rectMode(CENTER);
}

void draw() {
  background(150);
  fill(255, 0, 0);
  rect(width/2, height/2, width, height);
  pushMatrix();
  translate(mouseX, mouseY);
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