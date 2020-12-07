void game() {
  theme.play();
  intro.pause();
  intro.rewind();
  background(0);
  stroke(255, 255, 255, 255);
  rect(width - 1, -1, 50, 55);
  rect(width - 6, 12, 5, 15);
  rect(width - 16, 12, 5, 15);

  //#################### myObjects ####################
  int i = 0;
  rockcount = 0;
  ufocount = 0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i); //Get one object out of the list
    if (obj.lives > 0) {
      obj.act();
      obj.show();
      i++;
      if (obj instanceof Spacerock) {
        rockcount++;
      }
      if (obj instanceof UFO) {
        ufocount++;
      }
    } else {
      myObjects.remove(i);
    }
  }

  //#################### UFO Spawn ####################
  if (ufocount <= 0) {
    ufospawner = random(0, 600);
    ufodirection = random(0, 4);
    if (ufospawner < 1) {
      myObjects.add(new UFO());
    }
  }


  //#################### Lives Count ####################
  fill(255);
  if (livestimer < 30) fill(255, 0, 0);
  textSize(100);
  text("Lives: " + myShip.lives, width/2, 40);

  myShip.show();
  myShip.act();

  ufobtimer++;
  livestimer++;
  btimer++;

  if (rockcount <= 0) {
    mode = WIN;
    win.play();
  }
}

void keyPressed() {
  if (key == 'd' || key == 'D') {
    d = true;
  }
  if (key == 'a' || key == 'A') {
    a = true;
  }
  if (key == 'w' || key == 'W') {
    w = true;
  }
  if (key == 's' || key == 'S') {
    s = true;
  }
  if (keyCode == 32) {
    space = true;
  }
}

void keyReleased() {
  if (key == 'd' || key == 'D') {
    d = false;
  }
  if (key == 'a' || key == 'A') {
    a = false;
  }
  if (key == 'w' || key == 'W') {
    w = false;
  }
  if (key == 's' || key == 'S') {
    s = false;
  }
  if (keyCode == 32) {
    space = false;
  }
} 

void gameClicks() {
  if (buttonPressed(width - 1, -1, 50, 55)) {
    mode = PAUSE;
  }
}
