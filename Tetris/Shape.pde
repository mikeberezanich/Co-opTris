class Shape {
  int[][] shapeLayout = new int[3][3];
  int[] topLeftPos;

  public Shape(char letter, int c) {
    switch (letter) {
      case 'L': shapeLayout[0][0] = c;
                shapeLayout[0][1] = c;
                shapeLayout[0][2] = c;
                shapeLayout[1][2] = c;
                break;
      case 'J': shapeLayout[1][0] = c;
                shapeLayout[1][1] = c;
                shapeLayout[1][2] = c;
                shapeLayout[0][2] = c;
                break;
      case 'S': shapeLayout[0][0] = c;
                shapeLayout[0][1] = c;
                shapeLayout[1][1] = c;
                shapeLayout[1][2] = c;
                break;
      case 'Z': shapeLayout[1][0] = c;
                shapeLayout[1][1] = c;
                shapeLayout[0][1] = c;
                shapeLayout[0][2] = c;
                break;
      case 'O': shapeLayout[0][1] = c;
                shapeLayout[0][2] = c;
                shapeLayout[1][1] = c;
                shapeLayout[1][2] = c;
                break;
      case 'T': shapeLayout[1][1] = c;
                shapeLayout[0][2] = c;
                shapeLayout[1][2] = c;
                shapeLayout[2][2] = c;
                break;
      case 'I':  break;
    }
  }

  public void spawn() {
    topLeftPos = new int[] {NUM_COLS/2 - 1, 0};
  }

  public void rotateLeft() {
    int [][] rot = new int[3][3];

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        rot[j][shapeLayout.length - 1 - i] = shapeLayout[i][j];
      }
    }

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        shapeLayout[i][j] = rot[i][j];
      }
    }
  }

  public void moveLeft() {
    boolean canMove = true;
    
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (shapeLayout[i][j] > 0 && grid[topLeftPos[0] + i - 1][topLeftPos[1] + j] > 0) {
          canMove = false;
        }
      }
    }
    
    if (canMove){
      topLeftPos[0]--;
    }
  }

  public void moveRight() {
    boolean canMove = true;
    
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (shapeLayout[i][j] > 0 && grid[topLeftPos[0] + i + 1][topLeftPos[1] + j] > 0) {
          canMove = false;
        }
      }
    }
    
    if (canMove){
      topLeftPos[0]++;
    }
  }

  public void moveDown() {
    boolean canMove = true;
    
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (shapeLayout[i][j] > 0 && grid[topLeftPos[0] + i][topLeftPos[1] + j + 1] > 0) {
          canMove = false;
        }
      }
    }
    
    if (canMove){
      topLeftPos[1]++;
    }
    else {
      pinToWell();
      //for debugging
  for (int i = 0; i < NUM_COLS; i++) {
    for (int j = 0; j < NUM_ROWS; j++) {
      print(grid[i][j] + " ");
    }
    println();
  }
      score += clearRows();
      newShapeNeeded = true;
      
      
      if (isGameOver())
        endGame();
    }
  }

  public void drop() {
  //immediatly drop shape to lowest position possible 
  //check for completed rows and spawn next shape
  }
  
  public void pinToWell() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (shapeLayout[i][j] > 0) {
          grid[topLeftPos[0] + i][topLeftPos[1] + j] = shapeLayout[i][j];
        }
      }
    }
  }

}