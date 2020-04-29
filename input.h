#ifndef INPUT_H
#define INPUT_H

#include <SDL2/SDL.h>

#include <map>

class Input {
public:
  void BeginNewFrame();

  void KeyUpEvent(const SDL_Event &event);
  void KeyDownEvent(const SDL_Event &event);
  /*
    void MouseButtonDownEvent(const SDL_Event &event);
    void MouseButtonUpEvent(const SDL_Event &event);
  */
  // The below methods return true if the key is in the specified state.
  bool WasKeyPressed(SDL_Scancode key);
  bool WasKeyReleased(SDL_Scancode key);
  bool IsKeyHeld(SDL_Scancode key);
  /*
    bool WasButtonPressed(SDL_MouseButtonEvent button);
    bool WasButtonReleased(SDL_MouseButtonEvent button);
    bool IsButtonHeld(SDL_MouseButtonEvent button);
  */
private:
  std::map<SDL_Scancode, bool> held_keys_;
  std::map<SDL_Scancode, bool> pressed_keys_;
  std::map<SDL_Scancode, bool> released_keys_;
  /*
    std::map<SDL_MouseButtonEvent.button, bool> pressed_button_;
    std::map<SDL_MouseButtonEvent.button, bool> held_button_;
    std::map<SDL_MouseButtonEvent.button, bool> released_button_;
  */
};

#endif /* INPUT_H */
