class feet {
  int headSize; 
  int shoeW ;
  int shoeH; 
  int x,y;
  // initializes variables
  feet () {
    headSize = 70;
    shoeW = 30;
    shoeH = 80;
    x= 0;
    y= 0 + headSize/2;
    //gives values to variables
  }
  
   void display() {
      rect(x, y , shoeW, shoeH); //draws a rectangle
   }
  }