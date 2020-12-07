void win() {
  theme.pause();
  theme.rewind();
  background(50);
  fill(255);
  textSize(200);
  text("YOU WIN!", width/2, 200);
  button(400, 700, 200, 50, "Quit Game");
  button(400, 600, 200, 50, "Main Menu");
}

void winClicks() {
  if (buttonPressed(400, 700, 200, 50)) {
    exit();
  }

  if (buttonPressed(400, 600, 200, 50)) {
    mode = INTRO;
    setup();
  }
}
