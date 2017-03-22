int NUM_ROWS = 22, NUM_COLS = 12;
int BLOCK_SIZE = 40, TOP_OFFSET = 80;
int[][] grid = new int[NUM_COLS][NUM_ROWS];
int timer = 0;
boolean newShapeNeeded = false;
Shape currentShape;

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
  
  currentShape = new Shape('L', 2);
  currentShape.spawn();
  
  for (int i = 0; i < NUM_COLS; i++) {
    for (int j = 0; j < NUM_ROWS; j++) {
      print(grid[i][j] + " ");
    }
    println();
  }
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
  
  if (newShapeNeeded) {
    currentShape = new Shape('L', 2);
    currentShape.spawn();
    newShapeNeeded = false;
  }
  else {
    if (timer > 30) {
      timer = 0;
      currentShape.moveDown();
    }
  }
  
  timer++;
  
}

void handleInput() {
}