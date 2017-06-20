class IShape extends Shape {
    
  public IShape(int c) {
    super(c);
    shapeLayout = new int[4][4];
    prevLayout = new int[4][4];
    shapeLayout[1][0] = shapeColor;
    shapeLayout[1][1] = shapeColor;
    shapeLayout[1][2] = shapeColor;
    shapeLayout[1][3] = shapeColor;
    state = 0;
    maxState = 1;
  }
  
  public void resetShape() {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        shapeLayout[i][j] = 0;
      }
    }
  }
  
  public void rotateLeft() {
    prevLayout = shapeLayout;
    resetShape();
    
    if (state == 0) {
      shapeLayout[0][1] = shapeColor;
      shapeLayout[1][1] = shapeColor;
      shapeLayout[2][1] = shapeColor;
      shapeLayout[3][1] = shapeColor;
      println("State 0");
    }
    else if (state == 1) {
      shapeLayout[1][0] = shapeColor;
      shapeLayout[1][1] = shapeColor;
      shapeLayout[1][2] = shapeColor;
      shapeLayout[1][3] = shapeColor;
      println("State 1");
    }
    
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
        print(shapeLayout[i][j]);
      }
      println();
    }
    
    checkRotation();
    
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
        print(shapeLayout[i][j]);
      }
      println();
    }
  }
  
}