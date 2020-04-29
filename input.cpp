#include "input.h"

void Input::BeginNewFrame() {
  pressed_keys_.clear();
  released_keys_.clear();
  //  pressed_button_.clear();
  //  released_button_.clear();
}

void Input::KeyUpEvent(const SDL_Event &event) {
  released_keys_[event.key.keysym.scancode] = true;
  held_keys_[event.key.keysym.scancode] = false;
}

void Input::KeyDownEvent(const SDL_Event &event) {
  pressed_keys_[event.key.keysym.scancode] = true;
  held_keys_[event.key.keysym.scancode] = true;
}
/*
void Input::MouseButtonDownEvent(const SDL_Event &event) {
  pressed_button_[event.button.button] = true;
  held_button_[event.button.button] = true;
}

void Input::MouseButtonUpEvent(const SDL_Event &event) {
  released_button_[event.button.button] = true;
  held_button_[event.button.button] = false;
}
*/

bool Input::WasKeyPressed(SDL_Scancode key) { return pressed_keys_[key]; }

bool Input::WasKeyReleased(SDL_Scancode key) { return released_keys_[key]; }

bool Input::IsKeyHeld(SDL_Scancode key) { return held_keys_[key]; }
/*
bool Input::WasButtonPressed(SDL_MouseButtonEvent button) {
  return pressed_button_[button.button.button];
}

bool Input::WasButtonReleased(SDL_MouseButtonEvent button) {
  return released_button_[button.button.button];
}

bool Input::IsButtonHeld(SDL_MouseButtonEvent button) {
  return held_button_[button.button.button];
}
*/
