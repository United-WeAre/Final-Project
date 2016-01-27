class feet {
  int headSize; 
  int shoeW ;
  int shoeH; 
  int x,y;
  feet () {
    headSize = 70;
    shoeW = 30;
    shoeH = 80;
    x= 0;
    y= 0 + headSize/2;
  }
  
   void display() {
      rect(x, y , shoeW, shoeH);
   }
  }