class Shape {
  protected int[][] shapeLayout;
  protected int[][] prevLayout; //for holding the last layout, used for rotation collision checks
  protected int[] topLeftPos;
  protected int state;
  protected int maxState;
  protected int shapeColor;

  public Shape(int c) {
    state = 0;
    shapeColor = c;
  }
  
  public void resetShape() {
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
        shapeLayout[i][j] = 0;
      }
    }
  }

  public void spawn() {
    topLeftPos = new int[] {NUM_COLS/2 - 1, 0};
  }
  
  public void rotateLeft() {
    
  }

  public void checkRotation() {
    boolean canRotate = true;
    
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
        // Didn't use NUM_COLS constant here so make sure to change here if well size is changed
        if (shapeLayout[i][j] > 0 && topLeftPos[0] + i < 12 && grid[topLeftPos[0] + i][topLeftPos[1] + j] > 0) {
          canRotate = false;
        }
      }
    }
    
    if (canRotate) {
      state++;
      if (state > maxState)     
        state = 0;
    }
    else {
      for (int i = 0; i < shapeLayout.length; i++) {
        for (int j = 0; j < shapeLayout.length; j++) {
          shapeLayout[i][j] = prevLayout[i][j];
        }
      }
    }
  }
  
  public void setPrevLayout() {
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
        prevLayout[i][j] = shapeLayout[i][j];
      }
    }
  }

  public void moveLeft() {
    boolean canMove = true;
    
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
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
    
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
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
    
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
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
      score += clearRows();
      gameOver = isGameOver();
      newShapeNeeded = true;
      
    }
  }

  public void drop() {
  //immediatly drop shape to lowest position possible 
  //check for completed rows and spawn next shape
  }
  
  public void pinToWell() {
    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
        if (shapeLayout[i][j] > 0) {
          grid[topLeftPos[0] + i][topLeftPos[1] + j] = shapeLayout[i][j];
        }
      }
    }
  }

}