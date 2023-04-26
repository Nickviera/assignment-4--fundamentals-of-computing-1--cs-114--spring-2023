void drawBoard() {
  strokeWeight(4);
  line(width / 3, 0, width / 3, height); // vertical lines
  line(2 * width / 3, 0, 2 * width / 3, height);
  line(0, height / 3, width, height / 3); // horizontal lines
  line(0, 2 * height / 3, width, 2 * height / 3);

  for (int row = 0; row < board.length; row++) {
    float x = (row % 3) * width/3 + width/6; // x cordinate on board
    float y = floor(row / 3) * height/3 + height/6; // y cordinate on board
    fill(255);
    fill(0);
    text(board[row], x, y);
  }
}
