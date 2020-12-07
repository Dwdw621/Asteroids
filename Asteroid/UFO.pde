class UFO extends GameObject {
  PVector direction, top, left, right, bot, tv, lv, rv, bv;
  int i;
  float angle = random(TWO_PI);


  UFO() {
    location = new PVector();
    velocity = new PVector();
    size = 30;
    lives = 1;
    top = new PVector(random(width), -10);
    left = new PVector(-10, random(height));
    bot = new PVector(random(width), height+10);
    right = new PVector(width+10, random(height));
    tv = new PVector(0, 1);
    lv = new PVector(1, 0);
    bv = new PVector(0, -1);
    rv = new PVector(-1, 0);
  }

  void show() { 
    fill(0);
    stroke(255);
    ellipse(location.x, location.y - size/2, size, size);
    ellipse(location.x, location.y, size*2, size/2);
    if (lives < 1) {
      while (i < 10) {
        myObjects.add(new SpacerockP(location.x, location.y));
        i++;
        explosion.rewind();
        explosion.play();
      }
    }


    if (ufodirection < 1) {
      location = left;
      velocity = lv;
    }
    if (ufodirection >= 1 && ufodirection < 2) {
      location = right;
      velocity = rv;
    }
    if (ufodirection >= 2 && ufodirection < 3) {
      location = top;
      velocity = tv;
    }
    if (ufodirection >= 3 && ufodirection <= 4) {
      location = bot;
      velocity = bv;
    }
  }

  void act() {
    super.act();

    if (myShip.lives > 0) {
      if (ufobtimer > 60) {
        myObjects.add(new UFOBullet(location.x, location.y, myShip.location.x - location.x, myShip.location.y - location.y));
        ufobtimer = 0;
        shoot.rewind();
        shoot.play();
      }
    }

    if (location.x > width + 25 || location.x < 0 - 25 || location.y > height + 25 || location.y < 0 - 25) lives = 0;

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size + myObj.size) {
          myObj.lives = 0;
          lives--;
        }
      }
      i++;
    }
  }
}
