void gameover() {
  theme.pause();
  theme.rewind();
  fill(255);
  textSize(200);
  text("YOU LOSE!", width/2, 200);
  button(400, 600, 100, 50, "Menu");
}

void gameoverClicks() {
  if (buttonPressed(400, 600, 100, 50)) {
    mode = INTRO;
    setup();
  }
}
