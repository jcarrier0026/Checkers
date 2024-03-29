#ifndef GRAPHICS_H
#define GRAPHICS_H
#include <SDL2/SDL.h>

#include "sprite.h"
#include <vector>

// Structure to hold the RGB values of the background color.
struct {
  char red = 0x30;
  char green = 0x30;
  char blue = 0x30;
  char alpha = 0XFF;
} background_color;

class Graphics {
public:
  std::vector<std::vector<int>> checkerboard_ = {
      {2, 0, 2, 0, 2, 0, 2, 0}, {0, 2, 0, 2, 0, 2, 0, 2},
      {2, 0, 2, 0, 2, 0, 2, 0}, {0, 0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0, 0}, {0, 1, 0, 1, 0, 1, 0, 1},
      {1, 0, 1, 0, 1, 0, 1, 0}, {0, 1, 0, 1, 0, 1, 0, 1}};
  Graphics();
  ~Graphics();

  void ChangeWindowColor();

  // Attempts to create the game window.
  void CreateWindow();

  // Draw the next frame and clear the renderer.
  void DrawNextFrame();

  // Add this sprite to the renderer for the next frame at the specified
  // location.
  void AddSprite(const Sprite &sprite, const SDL_Rect &destination);

  // This returns a pointer to the renderer struct.
  // Exposing this is unfortunate but the Sprite needs access to it to create
  // textures.
  // This method should be used with caution.
  // The graphics class still owns the renderer.
  SDL_Renderer *GetRenderer() { return renderer_; }

private:
  SDL_Window *window_;
  SDL_Renderer *renderer_;
};

#endif // GRAPHICS_H
