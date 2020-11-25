void gameover() {
  background(105, 0, 105);
  button(400, 600, 100, 50, "Menu");
}

void gameoverClicks() {
  if (buttonPressed(400, 600, 100, 50)) {
    mode = INTRO;
  }
}
