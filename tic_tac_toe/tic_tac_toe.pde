//*******************************************************************************
//  Nicolas Viera                         April 26 2023
//
//
//Tic Tac Toe game against computer
//
//********************************************************************************

boolean playersTurn = false; // allows the computer to do first

void setup() {
  size(500, 500);
  textAlign(CENTER, CENTER);
  textSize(80);

}

void draw() {
  background(255);
  drawBoard();
  checkWinner();

  if (!playersTurn) {
    computersTurn();
    playersTurn = true;
  }
}


void keyPressed() { // code below allows the pressed key to place an x or o in the designated cell
  if (key >= '0' && key <= '8' && playersTurn) {
    int index = key - '0';
    if (board[index] != 'X' && board[index] != 'O') {
      board[index] = 'O';
      playersTurn = false;
    }
  } else {
    println("Incorect key.. Please press a valid key between 0 and 8");
  }
}

void checkWinner() {
  // check rows
  for (int row = 0; row < 9; row += 3) {
    if (board[row] == board[row+1] && board[row] == board[row+2]) {
      gameOver(board[row]);
      return;
    }
  }
  // check columns
  for (int col = 0; col < 3; col++) {
    if (board[col] == board[col+3] && board[col] == board[col+6]) {
      gameOver(board[col]);
      return;
    }
  }
  // check diagonals
  if (board[0] == board[4] && board[0] == board[8]) {
    gameOver(board[0]);
    return;
  }
  if (board[2] == board[4] && board[2] == board[6]) {
    gameOver(board[2]);
    return;
  }
  // check for tie
  boolean tie = true;
  for (int row = 0; row < board.length; row++) {
    if (board[row] != 'X' && board[row] != 'O') {
      tie = false;
      break;
    }
  }
  if (tie) {
    gameOver('T');
    return;
  }
}

void gameOver(char winner) {
  if (winner == 'X') {
    println("Computer wins! Game over!");
  } else if (winner == 'O') {
    println("Player wins! Game over!");
  } else {
    println("It's a tie! Game over!");
  }
  noLoop();
}

void computersTurn() {
  int index = -1;
  while (index == -1) {
    int randomIndex = int(random(0, 9));
    if (board[randomIndex] != 'X' && board[randomIndex] != 'O') {
      index = randomIndex;
    }
  }
  board[index] = 'X';
}
