class feet {
  int headSize; 
  int shoeW ;
  int shoeH; 
  int x,y;
  PImage shoe;
  // initializes variables
  feet () {
    headSize = 70;
    shoeW = 200;
    shoeH = 150;
    x= 0;
    y= 0 + headSize/2;
    shoe = loadImage("Cleat.png");
    //gives values to variables
  }
  
   void display() {
     fill(0,200,150);
      rect(x, y , shoeW/5, shoeH/3, 300); //draws a rectangle
      image(shoe, x-75, y-50, shoeW, shoeH); // shows image of cleat on the rectangle
   }
  }