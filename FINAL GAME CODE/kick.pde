import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioPlayer player;
Minim minim;//audio context

int headSize = 70; // sets headsize
int shoeW = 30; // sets shoe width
int shoeH = 80; // sets shoe height
float theta1 = 0; // sets the theta of player one
float theta2 = 0; // sets the theta of player two
float forwardKick = radians(8); // tells it how to rotate
float backKick = -radians(6);  // tells it how to rotate
float kick = forwardKick; //kick is the same as forwardkick
float forwardKick2 = radians(8); // tells it how to rotate
float backKick2 = -radians(6);  // tells it how to rotate
float kick2 = forwardKick2; //player2 kick is equal to forward kick
float head1y = 600; // player one head y pos
float head1x = 1000; // player one head x pos
float player1move = 20; //how much player moves by
float head2y = 600; // player two head y pos
float head2x = 200; // player one head x pos
float player2move = 20; //how much player moves by
float player1jump = 75; // sets jump height
float player2jump = 75; // sets jump height
int gameMode; //sets gamemode as an integer
boolean kickactivate1 = false; // sets the boolean to false
boolean kickactivate2 = false;  // sets the boolean to false
PImage miamiArena; //calls in a PImage
PImage drake; //calls in a PImage
PImage cent; //calls in a PImage
PImage khaled; //calls in a PImage
PImage kanye; //calls in a PImage
Ball b; //sets class variable name
feet f; //sets class variable name

void setup() {
  size(1280, 720); // sets size of canvas
  gameMode = 0; // sets gamemode value
  rectMode(CENTER); // how to draw the rectangle
  b= new Ball(); //sets class
  f = new feet(); //sets class
  miamiArena = loadImage("miamiArena.jpg"); //loads image and sets the variable
  drake = loadImage("DRAKE.png"); //loads image and sets the variable
  cent = loadImage("50_CENT.png"); //loads image and sets the variable
  khaled = loadImage("DJ_KHALED.png"); //loads image and sets the variable
  kanye = loadImage("KANYE.png"); //loads image and sets the variable
  minim = new Minim(this); 
  player = minim.loadFile("Yeah.mp3", 2048);
  player.play(); // This makes the music play
}

void draw() {

  if (gameMode == 0) { // if the gamemode is 0
    PImage WorldCupScreen; //calls PImage
    WorldCupScreen = loadImage("Start Screen.jpg"); //loads the image
    background(0); // sets backgrounf to 0
    image(WorldCupScreen, 0, 0); // draws the image
    if (keyPressed) { // if a key is pressed
      if (key == 'y') { // if y is pressed
        gameMode = 1; // change value to one
      }
    }

    if (keyPressed) {  // if a key is pressed
      if (key == 'u') { // if u is pressed
        gameMode = 2; // change value to two
      }
    }

    if (keyPressed) { // if a key is pressed
      if (key == 'r') { // if r is pressed
        gameMode = 3; // change value to 3
      }
    }

    if (keyPressed) { // if a key is pressed
      if (key == 't') { // if t is pressed
        gameMode = 4; // change value to 4
      }
    }
  } else if (gameMode == 1) { //and if the game mode is one
    miamiArena.resize(width, height); //resizes the image to width and height
    background(miamiArena); // sets the background as the image
  } else if (gameMode == 2) {  //and if the game mode is two
    miamiArena.resize(width, height); //resizes the image to width and height
    background(miamiArena); // sets the background as the image
  } else if (gameMode == 3) {  //and if the game mode is three
    miamiArena.resize(width, height); //resizes the image to width and height
    background(miamiArena); // sets the background as the image
  } else if (gameMode == 4) {  //and if the game mode is four
    miamiArena.resize(width, height); //resizes the image to width and height
    background(miamiArena); // sets the background as the image
  }
  if (gameMode >=1) { // if the gamemode is greater than one 
    b.display();
    b.move(); // run these constructors

    pushMatrix();
    translate(head1x, head1y); //change the origin to here
    fill(255); // set the fill
    ellipse(0, 0, headSize, headSize); //draws ellipse
    if (kickactivate1==true) { // if its is true
      rotate(theta1); // rotate the the first player's theta 
      theta1 += kick; // add kick to theta
    }
    f.display(); // run this
    b.collision (head1x + f.x, head1y + f.y); // if it is in contact with
    if (kickactivate1==true && theta1 >= PI/2) { // if they are both true
      kick = backKick; // kick is equal to backkick
    }
    if (kickactivate1==true && theta1 <= 0) { // if these are true
      kick = forwardKick; // kick is equal to forward kick
    }
    popMatrix(); // stop matrix
    pushMatrix();
    translate(head2x, head2y);
    fill(100,100,255);
    ellipse(0, 0, headSize, headSize);
    if (kickactivate2==true) {
      rotate(-theta2);
      theta2 += kick2;
    }
    f.display();
    b.collision (head2x + f.x, head2y + f.y);
    rotate(-theta2);
    if (kickactivate2==true && theta2 >= PI/2) {
      kick2 = backKick2;
    }
    if (kickactivate2==true && theta2 <= 0) {
      kick2 = forwardKick2;
    }
    popMatrix();
  }
  if (gameMode == 1) {
    image(khaled, head1x-101, head1y-108);
  }
  if (gameMode == 2) {
    image(kanye, head1x-101, head1y-102);
  }
  if (gameMode == 3) {
    image(cent, head1x-106, head1y-100);
  }
  if (gameMode == 4) {
    image(drake, head1x-99, head1y-100);
  }
}
// same as above just for other player 
void keyPressed() { // if this key is pressed
  if (keyCode == LEFT) { // if left key pressed
    head1x -= player1move; // subrtract from pos
  } else if (keyCode == 39) { //or if this key pressed
    head1x += player1move; // add to player pos
  }
  if (keyCode == 65) { // if this key is pressed 
    head2x -= player1move; // subrtract from pos
  } else if (keyCode == 68) { //or if this key pressed
    head2x += player1move; // add to player pos
  }
  if (keyCode == 32) { // if this key is pressed 
    println("activated kick1 in frame " + frameCount); //print this line
    kickactivate1=true; //makes it true
  }
  if (key == 'l') { // if this key is pressed 
    println("activated kick1 in frame " + frameCount); //print this line
    kickactivate2=true; //makes it true
  }
  if (keyCode == UP) {  // if this key is pressed 
    head1y -= player1jump; //subtracts from player pos
  }
  if (key == 'w') {  // if this key is pressed 
    head2y -= player2jump; //subtracts from player pos
  }
  head1x = constrain(head1x, 220, width-220); 
  head2x = constrain(head2x, 220, width-220);
  head1y = constrain(head1y, 500, 610);
  head2y = constrain(head2y, 500, 610); // consrains the variables to these values
}

void keyReleased () { // if key is released
  if (keyCode == 32) { //if this key is pressed
    kickactivate1=false; // make it false
    theta1=0; // reset it to original 
  }
  if (key == 'l') { //if this key is released
    kickactivate2=false;  // make it false
    theta2=0; //reset it back to original 
  }
  if (keyCode == UP) {  //if this key is released
    head1y = 600; //reset to pos
  }
  if (key == 'w') { //if this key is released
    head2y = 600; //reset to pos
  }
}