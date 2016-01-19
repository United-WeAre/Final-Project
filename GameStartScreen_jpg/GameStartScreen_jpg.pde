PImage WorldCupScreen;  //declare variables
float scaleFactor = 1/1000;

void setup() {
  size(1600,800);  //set canvas size
  WorldCupScreen = loadImage("WorldCupScreen.jpg");    //set FLashG variable to a picture of Flsah Gordon, saved from deskto
 }

void draw() {
  background(0);
 image(WorldCupScreen,0,0);
}