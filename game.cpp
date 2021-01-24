#include "game.h"

#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

#include <fstream>
#include <iostream>

#include "constants.h"

extern "C" {
void movePiece(int startX, int startY, int endX, int endY);
}

Game::Game() {}

Game::~Game() {}

bool Game::Run() {
  if (!InitSdl()) {
    return false;
  }

  // Initialize the game window.
  graphics_.CreateWindow();

  // Variables for user input..
  SDL_Event event;
  int mouseX, mouseY, boardX, boardY, a, b;
  bool piece_selected = false;
  bool inMenu = true;
  bool clicked;

  // The game loop.
  while (true) {
    clicked = false;
    // Clear out old keyup/keydown events.
    input_.BeginNewFrame();

    if (SDL_PollEvent(&event)) {
      switch (event.type) {
      case SDL_QUIT:
        return true;
        break;
      case SDL_KEYDOWN:
        if (event.key.repeat == 0) {
          input_.KeyDownEvent(event);
        }
        break;
      case SDL_KEYUP:
        input_.KeyUpEvent(event);
        break;
      case SDL_MOUSEBUTTONDOWN:
        if (event.button.button == SDL_BUTTON_LEFT) {
          clicked = true;
        }
        break;
      case SDL_MOUSEMOTION:
        mouseX = event.motion.x;
        mouseY = event.motion.y;
        break;
      default:
        // do nothing
        break;
      }
    }
    if (input_.WasKeyPressed(SDL_SCANCODE_ESCAPE)) {
      return true;
    }

    // What happens if you are in the menu.
    if (inMenu) {
      Sprite menu("menu", {.x = 0, .y = 0, .w = 100, .h = 100},
                  graphics_.GetRenderer());
      SDL_Rect destination = {.x = 0, .y = 0, .w = 800, .h = 800};

      graphics_.AddSprite(menu, destination);

      // If the start button is pressed.
      if (mouseX >= 260 && mouseX <= 515 && mouseY >= 212 && mouseY <= 291 &&
          clicked == true) {
        inMenu = false;
      }

      // If the quit button is pressed.
      else if (mouseX >= 260 && mouseX <= 515 && mouseY >= 500 &&
               mouseY <= 579 && clicked == true) {
        return true;
      }
    }

    // What happens if the game is being played.
    else {
      // What happens if a piece is clicked.
      if (clicked == true) {
        if (piece_selected == false) {
          boardY = mouseX / 100;
          boardX = mouseY / 100;
          piece_selected = true;
        } else {
          b = mouseX / 100;
          a = mouseY / 100;
          movePiece(boardX, boardY, a, b);
          inputFromFile();
          piece_selected = false;
        }
      }
      // Makes the board image appear on the screen.
      Sprite board("bw_board", {.x = 0, .y = 0, .w = 8, .h = 8},
                   graphics_.GetRenderer());
      SDL_Rect destination = {.x = 0, .y = 0, .w = 800, .h = 800};

      graphics_.AddSprite(board, destination);

      // Goes through our checkers vector<vector<int> and puts the different
      // piece images in the correct places on the board.
      for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
          if (graphics_.checkerboard_[i][j] == 2) {
            Sprite black_piece("b_piece", {.x = 0, .y = 0, .w = 10, .h = 10},
                               graphics_.GetRenderer());
            destination = {.x = j * 100, .y = i * 100, .w = 100, .h = 100};
            graphics_.AddSprite(black_piece, destination);
          } else if (graphics_.checkerboard_[i][j] == 1) {
            Sprite red_piece("r_piece", {.x = 0, .y = 0, .w = 10, .h = 10},
                             graphics_.GetRenderer());
            destination = {.x = j * 100, .y = i * 100, .w = 100, .h = 100};
            graphics_.AddSprite(red_piece, destination);
          } else if (graphics_.checkerboard_[i][j] == 3) {
            Sprite red_king_piece("rk_piece",
                                  {.x = 0, .y = 0, .w = 10, .h = 10},
                                  graphics_.GetRenderer());
            destination = {.x = j * 100, .y = i * 100, .w = 100, .h = 100};
            graphics_.AddSprite(red_king_piece, destination);
          } else if (graphics_.checkerboard_[i][j] == 4) {
            Sprite black_king_piece("bk_piece",
                                    {.x = 0, .y = 0, .w = 10, .h = 10},
                                    graphics_.GetRenderer());
            destination = {.x = j * 100, .y = i * 100, .w = 100, .h = 100};
            graphics_.AddSprite(black_king_piece, destination);
          }
        }
      }
    }
    graphics_.DrawNextFrame();
    LimitFrameRate();
  }
}

void Game::LimitFrameRate() {
  int current_time_ms = SDL_GetTicks();
  int elapsed_time_ms = current_time_ms - frame_start_time_ms;
  if (elapsed_time_ms < constants::kMaxFrameTimeMs) {
    SDL_Delay(constants::kMaxFrameTimeMs - elapsed_time_ms);
  }
}

bool Game::InitSdl() {
  if (SDL_Init(SDL_INIT_EVERYTHING) < 0) {
    std::cout << "SDL Failed to initialize. Error: " << SDL_GetError()
              << std::endl;
    return false;
  }
  IMG_Init(IMG_INIT_PNG);
  return true;
}

void Game::inputFromFile() {
  std::string filename = "Checkerboard.txt";
  std::ifstream infile(filename);
  if (!infile) {
    std::cout << "Unable to open file." << std::endl;
    exit(1);
  }
  if (infile.is_open()) {
    int x;
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        infile >> x;
        //  std::cout << i << " " << j << " " << x << std::endl;
        graphics_.checkerboard_[i][j] = x;
      }
    }
    infile.close();
  }
}
