void game() {
  background(0);
  rect(width - 1, -1, 50, 55);
  rect(width - 6, 12, 5, 15);
  rect(width - 16, 12, 5, 15);

  //####################myObjects####################
  int i = 0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i); //Go to certain 'page'
    if (obj.lives > 0) {
      obj.act();
      obj.show();
      i++;
    } else {
      myObjects.remove(i);
    }
  }

  fill(255);
  if (livestimer < 30) fill(255, 0, 0);
  textSize(20);
  text("Lives: " + myShip.lives, width/2, 25);

  myShip.show();
  myShip.act();
  
  ufotimer++;
  livestimer++;
  btimer++;
  
  println(myShip.direction);
  
  line(myShip.location.x, myShip.location.y, myShip.location.x + myShip.velocity.x * 10, myShip.location.y + myShip.velocity.y * 10);
  stroke(255,0,0);
  line(myShip.location.x, myShip.location.y, myShip.location.x + myShip.direction.x * 1000, myShip.location.y + myShip.direction.y * 1000);
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
  if (buttonPressed(400, 400, 100, 50)) {
    mode = GAMEOVER;
  }
}
