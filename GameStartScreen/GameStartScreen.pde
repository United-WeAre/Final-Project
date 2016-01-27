//PImage WorldCupScreen;  //declare variables
int gameMode;

void setup() {
  size(1280, 720);  //set canvas size
  gameMode = 0;
  //WorldCupScreen = loadImage("WorldCupScreen.jpg");
}

void draw() {
  if (gameMode == 0) {
    PImage WorldCupScreen;
    WorldCupScreen = loadImage("Start Screen.jpg");
    background(0);
    image(WorldCupScreen, 0, 0);
    fill(0);
    textSize(20);
    
    if (keyPressed) {
      if (key == 'y') {
        gameMode = 1;
      }
    }
    
    if (keyPressed) {
      if (key == 'u') {
        gameMode = 2;
      }
    }
    
    if (keyPressed) {
      if (key == 'r') {
        gameMode = 3;
      }
    }
    
    if (keyPressed) {
      if (key == 't') {
        gameMode = 4;
      }
    }
  } else if (gameMode == 1) {
    background(0);
    fill(255, 255, 255);
    text("DJ Khaled", width/2, height/2);
  } else if (gameMode == 2) {
    background(0);
    fill(255, 255, 255);
    text("Kanye", width/2, height/2);
  } else if (gameMode == 3) {
    background(0);
    fill(255, 255, 255);
    text("50 Cent", width/2, height/2);
  } else if (gameMode == 4) {
    background(0);
    fill(255, 255, 255);
    text("Drake", width/2, height/2);
  }
}