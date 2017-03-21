class Shape {
  int[][] shapeLayout;
  int[] topLeftPos;

  public Shape(char letter, int color) {
    switch (letter) {
      case 'L': shapeLayout = new int[3][3];
                shapeLayout[0][0] = color;
                shapeLayout[0][1] = color;
                shapeLayout[0][2] = color;
                shapeLayout[1][2] = color;
               break;

      //continue with this trend
      case 'Z': ... break;
      case 'S': ... break;
      case 'T': ... break;
      case 'I': ... break;
    }
  }

  public void Spawn() {
    //start a block in center of well at top
    topLeftPos = new int[] {NUM_ROWS/2, NUM_COLS};
  }

  public void Rotate() {
    int[][] rot;

    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout[0].length; j++) {
        rot[j][shapeLayout.length - 1 - i] = shapeLayout[i][j];
      }
    }

    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout[0].length; j++) {
        shapeLayout[i][j] = rot[i][j];
      }
    }
  }

  public void MoveLeft() {
  //check if moving left will cause collision
  //if not, move topLeftPos one block left
  }

  public void MoveRight() {
  //check if moving right will cause collision
  //if not, move topLeftPos one block right
  }

  public void MoveDown() {
  //check if moving down will cause collision
  //if so, check for completed rows and spawn next shape
  //if not, move topLeftPos one block down
  }

  public void Drop() {
  //immediatly drop shape to lowest position possible 
  //check for completed rows and spawn next shape
  }

}