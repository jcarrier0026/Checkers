extern "C" {
void outputBoard();
void movePiece(int startX, int startY, int endX, int endY);
}
int main() {
  movePiece(2, 4, 3, 5);
  movePiece(2, 2, 3, 3);
  movePiece(5, 5, 4, 4);
  movePiece(4, 4, 3, 3);
  return 0;
}
