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
  text("U", 570, 180);
  text("T", 985, 160);
  text("R", 1275, 173);
  if (keyPressed) {
    if (key == "Y") {
      println(it works);
    }
  }
}