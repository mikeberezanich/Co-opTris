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
    topLeftPos = new int[] {NUM_COLS/2 - 1, 0};
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
    
    
    
  }

  public void moveRight() {
  //check if moving right will cause collision
  //if not, move topLeftPos one block right
  }

  public void moveDown() {
    boolean canMove = true;

    for (int i = 0; i < 3; i++) {
      println("ShapeLayout " + i + 2 + ": " + shapeLayout[i][2]);
      println("Grid " + (topLeftPos[0]) + (topLeftPos[1] + 3) + ": " + grid[topLeftPos[0]][topLeftPos[1] + 3]);
      println("TopLeftPos: " + topLeftPos[0] + topLeftPos[1]);
      if (shapeLayout[i][2] > 0 && grid[topLeftPos[0] + i][topLeftPos[1] + 3] > 0) {
          canMove = false;
      }
    }
    
    if (canMove){
      for (int i = 0; i < 3; i++) {
        if (topLeftPos[1] > 0)
          grid[topLeftPos[0] + i][topLeftPos[1] - 1] = 0;
      }
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          println(topLeftPos[0] + i);
          println(topLeftPos[1] + j);
          grid[topLeftPos[0] + i][topLeftPos[1] + j] = shapeLayout[i][j];
        }
      }
      topLeftPos[1]++;
    }
    else {
      //clearRows(); //should this move to tetris.pde?
      for (int i = 0; i < NUM_COLS; i++) {
        for (int j = 0; j < NUM_ROWS; j++) {
          print(grid[i][j] + " ");
        }
        println();
      }
      newShapeNeeded = true; //maybe this
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