void pause() {
  theme.pause();
  background(25);
  fill(255);
  textSize(200);
  text("GAME PAUSED", width/2, 200);
  button(400, 600, 100, 50, "Game");
  button(400, 700, 200, 50, "Main Menu");
}

void pauseClicks() {
  if (buttonPressed(400, 600, 100, 50)) {
    mode = GAME;
  }

  if (buttonPressed(400, 700, 200, 50)) {
    mode = INTRO;
    setup();
  }
}
