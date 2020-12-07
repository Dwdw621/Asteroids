class Spacerock extends GameObject {

  float direction;
  float turnspeed;
  int i;

  Spacerock() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    size = random(30, 80);
    lives = 1;
    direction = random(-.05, .05);
    turnspeed = random(-.05, .05);
  }

  //NEW
  Spacerock(float s, float x, float y) {
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(random(-1.5, 1.5), random(-1.5, 1.5));
    size = s;
    direction = random(-.05, .05);
    turnspeed = random(-.05, .05);
  }

  void show() {
    fill(0);
    pushMatrix();
    stroke(255, 255);
    translate(location.x, location.y);
    rotate(direction);
    direction = direction + turnspeed;
    rect(0, 0, size, size);
    popMatrix();
    if (lives <= 0) { 
      while (i < 10) { //create 10 particles
        myObjects.add(new SpacerockP(location.x, location.y));
        i++;
      }
    }
  }

  void act() {
    super.act();

    if (location.x > width + size/2) location.x = 0 - size/2;
    if (location.x < 0 - size/2) location.x = width + size/2;
    if (location.y > height + size/2) location.y = 0 - size/2;
    if (location.y < 0 - size/2) location.y = height + size/2;

    if (dist(location.x, location.y, myShip.location.x, myShip.location.y) <= size/2 + 8) {
      if (livestimer > 60) {
        myShip.lives--;
        livestimer = 0;
        damage.rewind();
        damage.play();
      }
    }

    //NEW
    int i = 0;
    while (i <myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet || myObj instanceof UFOBullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          myObj.lives = 0;
          lives = 0;
          explosion.rewind();
          explosion.play();
          if (size > 30) {
            myObjects.add(new Spacerock(size/2, location.x, location.y));
            myObjects.add(new Spacerock(size/2, location.x, location.y));
          } else {
            lives = 0;
          }
        }
      }
      i++;
    }
  }
}
