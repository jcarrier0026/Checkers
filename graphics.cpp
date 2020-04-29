#include "graphics.h"

#include <iostream>

#include "constants.h"

// Graphics-related constants.
constexpr char kGameTitle[] = "Checkers";
constexpr float kMsPerSecond = 1000.0;

Graphics::Graphics() {}

Graphics::~Graphics() {
  // Destroy the window.
  SDL_DestroyWindow(window_);

  // Quit SDL gracefully.
  SDL_Quit();
}

void Graphics::CreateWindow() {
  // SDL method to create our window.
  SDL_CreateWindowAndRenderer(constants::kWindowWidth, constants::kWindowHeight,
                              0, &window_, &renderer_);
  SDL_SetWindowTitle(window_, kGameTitle);

  // Changes background.
  SDL_SetRenderDrawColor(renderer_, background_color.red,
                         background_color.green, background_color.blue,
                         background_color.alpha);

  // Clear the screen, putting our background color in every pixel.
  SDL_RenderClear(renderer_);

  // Displays our screen in the window.
  SDL_RenderPresent(renderer_);
}

void Graphics::DrawNextFrame() {
  // Draw the next frame to the screen.
  SDL_RenderPresent(renderer_);
  // Reset the renderer to prepare for the following frame.
  SDL_RenderClear(renderer_);
}

void Graphics::AddSprite(const Sprite &sprite, const SDL_Rect &destination) {
  // Draw this sprite on the screen.
  SDL_Rect source = sprite.GetSourceLocation();
  SDL_RenderCopy(renderer_, sprite.GetSpriteTexture(), &source, &destination);
}
