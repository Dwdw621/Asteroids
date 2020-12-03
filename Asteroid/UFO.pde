class UFO extends GameObject {
  PVector direction;
  int i;
  float angle = random(TWO_PI);


  UFO() {
    location = new PVector(400, 400);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    velocity.setMag(.1);
    size = 30;
    lives = 1;
  }

  void show() { 
    fill(0);
    stroke(255);
    ellipse(location.x, location.y - size/2, size, size);
    ellipse(location.x, location.y, size*2, size/2);
    line(location.x, location.y, location.x + myShip.location.x, location.y + myShip.location.y);
  }

  void act() {
    super.act();

    if (ufotimer > 30) {
      myObjects.add(new Bullet(location.x, location.y, myShip.location.x, myShip.location.y));
      ufotimer = 0;
    }


    //int i = 0;
    //while (i <myObjects.size()) {
    //  GameObject myObj = myObjects.get(i);
    //  if (myObj instanceof Bullet) {
    //    if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
    //      myObj.lives = 0;
    //      lives = 0;
    //    }
    //  }
    //  i++;
    //}
  }
}
