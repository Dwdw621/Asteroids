void intro() {
  background(155);
  button(500, 600, 100, 50, "Exit");
  button(300, 600, 100, 50, "Start");
  setup();
}

void introClicks() {
  if (buttonPressed(300, 600, 100, 50)) {
    mode = GAME;
  }

  if (buttonPressed(500, 600, 100, 50)) {
    exit();
  }
}
