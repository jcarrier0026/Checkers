extern "C" {
void outputBoard();
void movePiece(int startX, int startY, int endX, int endY);
}
int main() {
  movePiece(5, 5, 4, 4);
  movePiece(4, 4, 3, 5);
  movePiece(2, 6, 3, 5);
  movePiece(4, 4, 5, 5);
  movePiece(6, 6, 5, 5);
  movePiece(4, 4, 3, 5);
  movePiece(2, 4, 3, 5);
  return 0;
}
