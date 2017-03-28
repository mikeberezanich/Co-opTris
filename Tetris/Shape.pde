class Shape {
  protected int[][] shapeLayout;
  protected int[] topLeftPos;
  protected int state;
  protected int shapeColor;

  public Shape(char letter, int c) {
    state = 0;
    shapeColor = c;
    switch (letter) {
      case 'L': shapeLayout = new int[3][3];
                shapeLayout[0][0] = c;
                shapeLayout[0][1] = c;
                shapeLayout[0][2] = c;
                shapeLayout[1][2] = c;
                break;
      case 'J': shapeLayout = new int[3][3];
                shapeLayout[1][0] = c;
                shapeLayout[1][1] = c;
                shapeLayout[1][2] = c;
                shapeLayout[0][2] = c;
                break;
      case 'S': shapeLayout = new int[3][3];
                shapeLayout[0][0] = c;
                shapeLayout[0][1] = c;
                shapeLayout[1][1] = c;
                shapeLayout[1][2] = c;
                break;
      case 'Z': shapeLayout = new int[3][3];
                shapeLayout[1][0] = c;
                shapeLayout[1][1] = c;
                shapeLayout[0][1] = c;
                shapeLayout[0][2] = c;
                break;
      case 'O': shapeLayout = new int[2][2];
                shapeLayout[0][0] = c;
                shapeLayout[0][1] = c;
                shapeLayout[1][0] = c;
                shapeLayout[1][1] = c;
                break;
      case 'T': shapeLayout = new int[3][3]; 
                shapeLayout[1][1] = c;
                shapeLayout[0][2] = c;
                shapeLayout[1][2] = c;
                shapeLayout[2][2] = c;
                break;
      case 'I': shapeLayout = new int[4][4];
                shapeLayout[0][0] = c;
                shapeLayout[1][0] = c;
                shapeLayout[2][0] = c;
                shapeLayout[3][0] = c;
                break;
    }
  }
  
  public void resetShape() {
    
  }

  public void spawn() {
    topLeftPos = new int[] {NUM_COLS/2 - 1, 0};
  }

  public void rotateLeft() {
    int [][] rot = new int[shapeLayout.length][shapeLayout.length];

    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
        rot[j][shapeLayout.length - 1 - i] = shapeLayout[i][j];
      }
    }

    for (int i = 0; i < shapeLayout.length; i++) {
      for (int j = 0; j < shapeLayout.length; j++) {
        shapeLayout[i][j] = rot[i][j];
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