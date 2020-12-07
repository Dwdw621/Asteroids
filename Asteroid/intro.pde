float y = -30;

void intro() {
  intro.play();
  background(100);
  fill(255);
  textFont(font, 300);
  
  if(y < 200) y++;
  text("ASTEROIDS", 400, y);
  textFont(font, 75);
  text("SOUND ON!", 400, 275);
  button(500, 600, 100, 50, "Exit");
  button(300, 600, 100, 50, "Start");
}

void introClicks() {
  if (buttonPressed(300, 600, 100, 50)) {
    mode = GAME;
  }

  if (buttonPressed(500, 600, 100, 50)) {
    exit();
  }
}
