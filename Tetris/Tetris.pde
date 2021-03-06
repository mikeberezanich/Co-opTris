int NUM_ROWS = 22, NUM_COLS = 12;
int BLOCK_SIZE = 40, TOP_OFFSET = 80;
int[][] grid = new int[NUM_COLS][NUM_ROWS];
int timer = 0, score = 0;
boolean newShapeNeeded = false;
boolean gamePaused = false;
boolean gameStarted = false;
boolean gameOver = false;
Shape currShape;
PImage titleScreen; 

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
  
  titleScreen = loadImage("TitleScreen.png"); 
  
  spawnRandomShape();
}

void draw() {
  
  if (gameOver) {
    endGame();
  }
  else if (gameStarted) {
    drawWell();
    drawCurrShape();
    
    pushMatrix();
    fill(255);
    textSize(18);
    text("Score: " + score, 50, 25);
    popMatrix();
    
    if (newShapeNeeded) {
      spawnRandomShape();
      newShapeNeeded = false;
    } else {
      if (timer > 30) {
        timer = 0;
        currShape.moveDown();
      }
    }
    
    timer++;
  }
  else {
    showStartMenu();
  }
}

void drawWell() {
  for (int i = 0; i < NUM_COLS; i++) {
    for (int j = 0; j < NUM_ROWS; j++) {
      switch(grid[i][j]) {
        case 0: fill(0);
                break;
        case 1: fill(127);
                break;
        case 2: fill(23, 189, 205);
                break;
        case 3: fill(71, 205, 22);
                break; 
        case 4: fill(205, 38, 22);
                break; 
        case 5: fill(22, 47, 205);
                break;
        case 6: fill(123, 22, 205);
                break; 
        case 7: fill(242, 169, 43);
                break;        
        case 8: fill(242, 255, 12);
                break;       
      }
      int startX = i * BLOCK_SIZE;
      int startY = j * BLOCK_SIZE;// + TOP_OFFSET;
      rect(startX, startY, BLOCK_SIZE, BLOCK_SIZE);
    }
  }
}

void drawCurrShape() {
  switch(currShape.shapeColor) {
        case 2: fill(23, 189, 205);
                break;
        case 3: fill(71, 205, 22);
                break; 
        case 4: fill(205, 38, 22);
                break; 
        case 5: fill(22, 47, 205);
                break;
        case 6: fill(123, 22, 205);
                break; 
        case 7: fill(242, 169, 43);
                break;        
        case 8: fill(242, 255, 12);
                break;       
      }
  
  for (int i = 0; i < currShape.shapeLayout.length; i++) {
    for (int j = 0; j < currShape.shapeLayout[0].length; j++) {
      if (currShape.shapeLayout[i][j] > 0) {
        int startX = (currShape.topLeftPos[0] + i) * BLOCK_SIZE;
        int startY = (currShape.topLeftPos[1] + j) * BLOCK_SIZE;
        rect(startX, startY, BLOCK_SIZE, BLOCK_SIZE);
      }
    }
  }
}

void keyPressed() {
  switch (keyCode) {
    case DOWN: currShape.moveDown();
               break;
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

void mouseReleased() {
  currShape.setPrevLayout();
  currShape.resetShape();
  currShape.rotateLeft();
  currShape.checkRotation();
}

int clearRows() {
  boolean isRowClear = true;
  int rowsCleared = 0;
  int points = 0;
  
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
  
  switch (rowsCleared) {
    case 1: points = 100;
            break;
    case 2: points = 250;
            break;
    case 3: points = 500;
            break;
    case 4: points = 800;
            break;
  }
  
  return points;
}

void spawnRandomShape() {
  int randLetter, randColor;
  
  randLetter = int(random(7));
  randColor = int(random(7));
  
  if (randLetter == 0)
    currShape = new IShape(randColor + 2);
  else if (randLetter == 1)
    currShape = new LShape(randColor + 2);
  else if (randLetter == 2)
    currShape = new OShape(randColor + 2);
  else if (randLetter == 3)
    currShape = new TShape(randColor + 2);
  else if (randLetter == 4)
    currShape = new SShape(randColor + 2);
  else if (randLetter == 5)
    currShape = new ZShape(randColor + 2);
  else
    currShape = new JShape(randColor + 2);
  
  currShape.spawn();
}

boolean isGameOver() {
  for (int i = 1; i < NUM_COLS - 1; i++) {
    if (grid[i][0] != 0)
      return true;
  }
  return false;
}

void showStartMenu() {
  image(titleScreen, 0, 0, width, height);
  fill(255);
  textSize(18);
  text("Controls: ", 10, 20);
  text("Player 1: Arrow keys to move block", 30, 40);
  text("Player 2: Mouse click to rotate", 30, 60);
  text("Be careful not to rotate too close to border!", 30, 80);
  text("For music I recommend playing Tina Guo's Tetris", 10, 820);
  text("theme from \"Game On!\" on repeat but I did not", 10, 840);
  text("include in case of copyright issues", 10, 860);
  
  rectMode(CENTER);
  fill(91, 231, 237);
  stroke(255);
  strokeWeight(3);
  rect(width/2, 700, 40, 40);
  rect(width/2 - 40, 700, 40, 40);
  rect(width/2 - 80, 700, 40, 40);
  rect(width/2 + 40, 700, 40, 40);
  rect(width/2 + 80, 700, 40, 40);
  textSize(36);
  fill(255);
  text("S", width/2 - 90, 715);
  text("T", width/2 - 50, 715);
  text("A", width/2 - 10, 715);
  text("R", width/2 + 30, 715);
  text("T", width/2 + 70, 715);
  
  
  rectMode(CORNER);
  stroke(0);
  strokeWeight(2);
  
  if (mousePressed && (mouseX >= 140 && mouseX <= 340) && (mouseY >= 680 && mouseY <= 720))
    gameStarted = true;
}

void endGame() {
  fill(255);
  background(0);
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2 - 100);
  text("Final Score: " + score, width/2, height/2 - 50);
  //noLoop();
  
  rectMode(CENTER);
  fill(91, 231, 237);
  stroke(255);
  strokeWeight(3);
  rect(width/2, 485, 40, 40);
  rect(width/2 - 40, 485, 40, 40);
  rect(width/2 - 80, 485, 40, 40);
  rect(width/2 - 120, 485, 40, 40);
  rect(width/2 + 40, 485, 40, 40);
  rect(width/2 + 80, 485, 40, 40);
  rect(width/2 + 120, 485, 40, 40);
  textSize(36);
  fill(255);
  text("R", width/2 - 120, 500);
  text("E", width/2 - 80, 500);
  text("S", width/2 - 40, 500);
  text("T", width/2, 500);
  text("A", width/2 + 40, 500);
  text("R", width/2 + 80, 500);
  text("T", width/2 + 120, 500);
  
  rectMode(CORNER);
  textAlign(LEFT); //<>//
  stroke(0);
  strokeWeight(2);
  
  if (mousePressed && (mouseX >= 100 && mouseX <= 380) && (mouseY >= 460 && mouseY <= 500)){
    for (int i = 0; i < NUM_ROWS; i++) {
      for (int j = 0; j < NUM_COLS; j++) {
        grid[j][i] = 0;
      }
    }
    for (int i = 0; i < NUM_ROWS; i++) {
      grid[0][i] = 1;
      grid[NUM_COLS - 1][i] = 1;
    }
    for (int i = 0; i < NUM_COLS; i++) {
      grid[i][NUM_ROWS - 1] = 1;
    }     
    score = 0;
    gameOver = false;
  }
}