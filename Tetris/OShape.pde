class OShape extends Shape {
    
  public OShape(int c) {
    super(c);
    shapeLayout = new int[2][2];
    prevLayout = new int[2][2];
    shapeLayout[0][0] = shapeColor;
    shapeLayout[0][1] = shapeColor;
    shapeLayout[1][0] = shapeColor;
    shapeLayout[1][1] = shapeColor;
    state = 0;
    maxState = 0;
  }
  
  public void rotateLeft() {
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
        shapeLayout[i][j] = prevLayout[i][j];
      }
    }
  }
  
}