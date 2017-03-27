int NUM_ROWS = 22, NUM_COLS = 12;
int BLOCK_SIZE = 40, TOP_OFFSET = 80;
int[][] grid = new int[NUM_COLS][NUM_ROWS];
int timer = 0, score = 0;
boolean newShapeNeeded = false;
boolean gamePaused = false;
Shape currShape;

void setup() {
  size(480, 880);
  
  //set up the border for our well
  for (int i = 0; i < NUM_ROWS; i++) {
    grid[0][i] = 1;
    grid[NUM_COLS - 1][i] = 1;
  }
  for (int i = 0; i < NUM_COLS; i++) {
    grid[i][NUM_ROWS - 1] = 1;
  }
  
  
  spawnRandomShape();
  
  ////for debugging
  //for (int i = 0; i < NUM_COLS; i++) {
  //  for (int j = 0; j < NUM_ROWS; j++) {
  //    print(grid[i][j] + " ");
  //  }
  //  println();
  //}
}

void draw() {
  
  //draws grid to screen
  for (int i = 0; i < NUM_COLS; i++) {
    for (int j = 0; j < NUM_ROWS; j++) {
      switch(grid[i][j]) {
        case 0: fill(0);
                break;
        case 1: fill(127);
                break;
        case 2: fill(91, 231, 237);
                break;
      }
      int startX = i * BLOCK_SIZE;
      int startY = j * BLOCK_SIZE;// + TOP_OFFSET;
      rect(startX, startY, BLOCK_SIZE, BLOCK_SIZE);
    }
  }
  
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      if (currShape.shapeLayout[i][j] > 0) {
        int startX = (currShape.topLeftPos[0] + i) * BLOCK_SIZE;
        int startY = (currShape.topLeftPos[1] + j) * BLOCK_SIZE;
        fill(91, 231, 237);
        rect(startX, startY, BLOCK_SIZE, BLOCK_SIZE);
      }
    }
  }
  
  pushMatrix();
  fill(255);
  textSize(18);
  text("Score: " + score, 50, 25);
  popMatrix();
  
  if (newShapeNeeded) {
    spawnRandomShape();
    newShapeNeeded = false;
  }
  else {
    if (timer > 30) {
      timer = 0;
      currShape.moveDown();
    }
  }
  
  timer++;
  
}

void keyReleased() {
  switch (keyCode) {
    case LEFT: currShape.moveLeft();
               break;
    case RIGHT: currShape.moveRight();
                break;
    case ENTER:
    case RETURN: if (gamePaused){
                   gamePaused = false;
                   loop();
                 }
                   
                 else {
                   gamePaused = true;
                   noLoop();
                 }
                 break;
  }
}

void keyPressed() {
  switch (keyCode) {
    case DOWN: currShape.moveDown();
               break;
  }
}

void mouseReleased() {
  currShape.rotateLeft();
}

int clearRows() {
  boolean isRowClear = true;
  int rowsCleared = 0;
  
  int i, j;
  for (i = 0; i < NUM_ROWS - 1; i++) {
    for (j = 0; j < NUM_COLS - 1; j++) {
      if (grid[j][i] == 0){
        isRowClear = false;
      }
    }
    if (isRowClear) {
      rowsCleared += 1;
      for (j = 1; j < NUM_COLS - 1; j++) {
        grid[j][i] = 0;
      }
      for (int k = i; k > 0; k--) {
        for (j = 1; j < NUM_COLS - 1; j++) {
          grid[j][k] = grid[j][k - 1];
        }
      }
    }
    isRowClear = true; 
  }
  
  return rowsCleared * 100;
}

void spawnRandomShape() {
  int randLetter, randColor;
  char letter;
  
  randLetter = int(random(5));
  randColor = int(random(8));
  
  if (randLetter == 0)
    letter = 'L';
  else if (randLetter == 1)
    letter = 'Z';
  else if (randLetter == 2)
    letter = 'O';
  else if (randLetter == 3)
    letter = 'T';
  else if (randLetter == 4)
    letter = 'S';
  else
    letter = 'J'; //add I later
  
  
  currShape = new Shape(letter, 2);
  currShape.spawn();
}

boolean isGameOver() {
  for (int i = 1; i < NUM_COLS - 1; i++) {
    if (grid[i][0] != 0)
      return true;
  }
  return false;
}

void endGame() {
  println("Game over");
  fill(255);
  rect(0, 0, width, height);
  fill(0);
  textSize(32);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2 - 40);
  text("Final Score: " + score, width/2, height/2 + 40);
  noLoop();
}