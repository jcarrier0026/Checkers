using namespace std;

// TODO: Turns
// TODO: Turns/Multi-Jumping

void outputBoard(vector<vector<int>> board) {
  /*
    cout << "------------------------------------\n";
    cout << "___|_0_|_1_|_2_|_3_|_4_|_5_|_6_|_7_|\n";
    for (int i = 0; i < 8; i++) {
      cout << "_" << i << "_|";
      for (int j = 0; j < 8; j++) {
        if ((i + j) % 2 == 1 || board[i][j] == 0) {
          cout << "[ ] ";
        } else {
          cout << "[" << board[i][j] << "] ";
        } // if-else
      }   // for j

      cout << "\n";
    } // for i
  */
} // outputBorad

void kingMe(vector<vector<int>> &board) {

  for (int i = 0; i < 8; i++) {
    if (board[0][i] == 1) {
      board[0][i] = 3;
    } // if
    if (board[7][i] == 2) {
      board[7][i] = 4;
    } // if
  }   // for
} // kingMe

void move(vector<vector<int>> &board, vector<int> start, vector<int> moveTo) {

  if (start[0] < 0 || start[0] > 7 || start[1] < 0 || start[1] > 7) {
    //    cout << "Cannot move to that square! (Starting square is out of
    //    bounds)\n";
    return;
  } // if
  if (moveTo[0] < 0 || moveTo[0] > 7 || moveTo[1] < 0 || moveTo[1] > 7) {
    //    cout << "Cannot move to that square! (Destination square is out of "
    //    "bounds)\n";
    return;
  } // if
  if ((moveTo[0] + moveTo[1]) % 2 == 1) {
    //    cout << "Cannot move to that square! (It's not the right color)\n";
    return;
  } // if
  if ((board[start[0]][start[1]] == 2 &&
       moveTo[0] != start[0] + 1) || // 2's can only move down
      (moveTo[1] != start[1] - 1 &&
       moveTo[1] !=
           start[1] + 1) || // pieces can only move diagonal (not straight)
      (board[start[0]][start[1]] == 1 &&
       moveTo[0] != start[0] - 1)) { // 1's can only move up
    //    cout << "Cannot move to that square! (Pieces cannot move
    //    backwards)\n";
    return;
  } // if
  if (board[moveTo[0]][moveTo[1]] == board[start[0]][start[1]]) {
    //    cout << "Cannot move to that square! (There is already a friendly
    //    piece " "there)\n";
    return;
  } // if
  if (board[start[0]][start[1]] == 0) {
    //    cout << "Cannot move to that square! (There is not a piece to
    //    move)\n";
    return;
  } // if

  if ((board[moveTo[0]][moveTo[1]] != 0 &&
       board[moveTo[0]][moveTo[1]] % 2 != board[start[0]][start[1]] % 2)) {
    int testx;
    int testy;
    testx = (moveTo[0] - start[0]) * 2 + start[0];
    testy = (moveTo[1] - start[1]) * 2 + start[1];
    if (testx > 7 || testx < 0 || testy > 7 || testy < 0) {
      //      cout << "Cannot move to that square! (Jump is out of bounds)\n";
      return;
    } // if
    if (board[testx][testy] != 0) {
      //      cout << "Cannot move to that square! (Space is occupied)\n";
      return;
    } // if
    board[testx][testy] = board[start[0]][start[1]];
    board[moveTo[0]][moveTo[1]] = 0;
    board[start[0]][start[1]] = 0;
  } // if

  board[moveTo[0]][moveTo[1]] = board[start[0]][start[1]];
  board[start[0]][start[1]] = 0;
  kingMe(board);

} // move
