extern "C" {
void outputBoard();
void movePiece(int startX, int startY, int endX, int endY);
}
int main() {
  movePiece(5, 1, 4, 2);
  return 0;
}
