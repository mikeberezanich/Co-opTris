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
  
  public void rotateLeft() {
    if (state == 0) {
      shapeLayout[0][1] = shapeColor;
      shapeLayout[1][1] = shapeColor;
      shapeLayout[2][1] = shapeColor;
      shapeLayout[3][1] = shapeColor;
    }
    else if (state == 1) {
      shapeLayout[1][0] = shapeColor;
      shapeLayout[1][1] = shapeColor;
      shapeLayout[1][2] = shapeColor;
      shapeLayout[1][3] = shapeColor;
    }
  }
  
}