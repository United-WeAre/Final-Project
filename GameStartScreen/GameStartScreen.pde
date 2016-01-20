PImage WorldCupScreen;  //declare variables

void setup() {
  size(1600, 800);  //set canvas size
  WorldCupScreen = loadImage("WorldCupScreen.jpg");    //set FLashG variable to a picture of Flsah Gordon, saved from deskto
}

void draw() {
  background(0);
  image(WorldCupScreen, 0, 0);
  fill(0);
  textSize(20);
  text("Y", 335, 180);
  if (keyPressed) {
    if (key == 'y') {
      println("YYYYYYYY"); //All of the println's were made just for testing purposes
    }
  }
  text("U", 570, 180);
  if (keyPressed) {
    if (key == 'u') {
      println("UUUUUUUU");
    }
  }
  text("T", 985, 160);
  if (keyPressed) {
    if (key == 't') {
      println("TTTTTTTT");
    }
  }
  text("R", 1275, 173);
  if (keyPressed) {
    if (key == 'r') {
      println("RRRRRRRRRRR");
    }
  }
}