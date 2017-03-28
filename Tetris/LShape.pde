//this is not actually in use, may change to inherited classes later
//class LShape extends Shape {
    
//  public LShape(int c) {
//    super(c);
//    shapeLayout = new int[3][3];
//    shapeLayout[0][0] = c;
//    shapeLayout[0][1] = c;
//    shapeLayout[0][2] = c;
//    shapeLayout[1][2] = c;
//    state = 0;
//  }
  
//  public void resetShape() {
//    for (int i = 0; i < 3; i++) {
//      for (int j = 0; j < 3; j++) {
//        shapeLayout[i][j] = 0;
//      }
//    }
//  }
  
//  public void rotateLeft() {
//    resetShape();
//    if (state == 0) {
//      shapeLayout[0][2] = shapeColor;
//      shapeLayout[1][2] = shapeColor;
//      shapeLayout[2][2] = shapeColor;
//      shapeLayout[2][1] = shapeColor;
//    }
//    else if (state == 1) {
//      shapeLayout[2][0] = shapeColor;
//      shapeLayout[2][1] = shapeColor;
//      shapeLayout[2][2] = shapeColor;
//      shapeLayout[1][0] = shapeColor;
//    }
//    else if (state == 2) {
//      shapeLayout[0][1] = shapeColor;
//      shapeLayout[1][1] = shapeColor;
//      shapeLayout[2][1] = shapeColor;
//      shapeLayout[0][2] = shapeColor;
//    }
//    else if (state == 3) {
//      shapeLayout[0][0] = shapeColor;
//      shapeLayout[0][1] = shapeColor;
//      shapeLayout[0][2] = shapeColor;
//      shapeLayout[1][2] = shapeColor;
//    }
    
//    state++;
//    if (state > 3)
//      state = 0;
    
//  }
//}