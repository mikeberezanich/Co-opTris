class Shape {
  int[][] shapeLayout;
  int[] topLeftPos;

  public Shape(char letter, int c) {
    switch (letter) {
      case 'L': shapeLayout = new int[3][3];
                shapeLayout[0][0] = c;
                shapeLayout[0][1] = c;
                shapeLayout[0][2] = c;
                shapeLayout[1][2] = c;
               break;

      //continue with this trend
      case 'Z':  break;
      case 'S':  break;
      case 'T':  break;
      case 'I':  break;
    }
  }

  public void spawn() {
    //start a block in center of well at top
    topLeftPos = new int[] {NUM_COLS/2, 0};
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        grid[topLeftPos[0] + i][topLeftPos[1] + j] = shapeLayout[i][j];
      }
    }
  }

  public void rotateRight() {
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
          break;
        }
      }
    }
    
    if (canMove){
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          grid[topLeftPos[0] + i][topLeftPos[1] + j] = 0;
        }
      }
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          grid[topLeftPos[0] + i - 1][topLeftPos[1] + j] = shapeLayout[i][j];
          topLeftPos[0]--;
        }
      }
    }
    
  }

  public void moveRight() {
  //check if moving right will cause collision
  //if not, move topLeftPos one block right
  }

  public void moveDown() {
    boolean canMove = true;
    
    //for (int i = 0; i < 3; i++) {
    //  for (int j = 0; j < 3; j++) {
    //    if (shapeLayout[i][j] > 0 && grid[topLeftPos[0] + i][topLeftPos[1] + j + 1] > 0) {
    //      canMove = false;
    //      break;
    //    }
    //  }
    //}
    
    if (canMove){
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          grid[topLeftPos[0] + i][topLeftPos[1] + j] = 0;
        }
      }
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          println(topLeftPos[0]);
          println(topLeftPos[1]);
          grid[topLeftPos[0]][topLeftPos[1]] = shapeLayout[i][j];
          topLeftPos[1]++;
        }
      }
    }
  //check if moving down will cause collision
  //if so, check for completed rows and spawn next shape
  //if not, move topLeftPos one block down
  }

  public void drop() {
  //immediatly drop shape to lowest position possible 
  //check for completed rows and spawn next shape
  }

}