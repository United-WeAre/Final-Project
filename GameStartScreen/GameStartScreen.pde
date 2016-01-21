//PImage WorldCupScreen;  //declare variables
int gameMode;

void setup() {
  size(1600, 800);  //set canvas size
  gameMode = 0;
  //WorldCupScreen = loadImage("WorldCupScreen.jpg");
}

void draw() {
  if (gameMode == 0) {
    PImage WorldCupScreen;
    WorldCupScreen = loadImage("WorldCupScreen.jpg");
    background(0);
    image(WorldCupScreen, 0, 0);
    fill(0);
    textSize(20);
    text("Y", 335, 180);
    if (keyPressed) {
      if (key == 'y') {
        println("YYYYYYYY");
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
  } else if (gameMode == 1) {
    background(0);
  }
}