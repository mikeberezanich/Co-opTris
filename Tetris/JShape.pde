class JShape extends Shape {
    
  public JShape(int c) {
    super(c);
    shapeLayout = new int[3][3];
    prevLayout = new int[3][3];
    shapeLayout[1][0] = shapeColor;
    shapeLayout[1][1] = shapeColor;
    shapeLayout[1][2] = shapeColor;
    shapeLayout[0][2] = shapeColor;
    state = 0;
    maxState = 3;
  }
  
  public void rotateLeft() {
    if (state == 0) {
      shapeLayout[0][1] = shapeColor;
      shapeLayout[1][1] = shapeColor;
      shapeLayout[2][1] = shapeColor;
      shapeLayout[2][2] = shapeColor;
    }
    else if (state == 1) {
      shapeLayout[2][0] = shapeColor;
      shapeLayout[1][0] = shapeColor;
      shapeLayout[1][1] = shapeColor;
      shapeLayout[1][2] = shapeColor;
    }
    else if (state == 2) {
      shapeLayout[0][1] = shapeColor;
      shapeLayout[1][1] = shapeColor;
      shapeLayout[2][1] = shapeColor;
      shapeLayout[0][0] = shapeColor;
    }
    else if (state == 3) {
      shapeLayout[1][0] = shapeColor;
      shapeLayout[1][1] = shapeColor;
      shapeLayout[1][2] = shapeColor;
      shapeLayout[0][2] = shapeColor;
    }
  }
}