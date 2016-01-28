import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

AudioPlayer player;
Minim minim;//audio context

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
float head1x = 1000;
float player1move = 20;
float head2y = 600;
float head2x = 200;
float player2move = 20;
float player1jump = 35;
float player2jump = 35;
int gameMode;
boolean kickactivate1 = false;
boolean kickactivate2 = false;
PImage miamiArena;
PImage drake;
PImage cent;
PImage khaled;
PImage kanye;
Ball b;
feet f;

void setup() {
  size(1280, 720);
  gameMode = 0;
  rectMode(CENTER);
  b= new Ball();
  f = new feet();
  miamiArena = loadImage("miamiArena.jpg");
  drake = loadImage("DRAKE.png");
  cent = loadImage("50_CENT.png");
  khaled = loadImage("DJ_KHALED.png");
  kanye = loadImage("KANYE.png");
  minim = new Minim(this);
  player = minim.loadFile("Yeah.mp3", 2048);
  player.play();
}

void draw() {

  if (gameMode == 0) {
    PImage WorldCupScreen;
    WorldCupScreen = loadImage("Start Screen.jpg");
    background(0);
    image(WorldCupScreen, 0, 0);
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
    miamiArena.resize(width, height);
    background(miamiArena);
  } else if (gameMode == 2) {
    miamiArena.resize(width, height);
    background(miamiArena);
  } else if (gameMode == 3) {
    miamiArena.resize(width, height);
    background(miamiArena);
  } else if (gameMode == 4) {
    miamiArena.resize(width, height);
    background(miamiArena);
  }
  if (gameMode >=1) {
    b.display();
    b.move();

    pushMatrix();
    translate(head1x, head1y);
    fill(255);
    ellipse(0, 0, headSize, headSize);
    if (kickactivate1==true) {
      rotate(theta1);
      theta1 += kick;
    }
    f.display();
    b.collision (head1x + f.x, head1y + f.y);
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
    image(cent, head1x-106, head1y-100); //53 110
  }
  if (gameMode == 4) {
    image(drake, head1x-99, head1y-100);
  }
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
  head1x = constrain(head1x, 220, width-220);
  head2x = constrain(head2x, 220, width-220);
  head1y = constrain(head1y, 500, 610);
  head2y = constrain(head2y, 500, 610);
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