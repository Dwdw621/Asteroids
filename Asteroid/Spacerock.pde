class Spacerock extends GameObject {
  
  float direction;
  float turnspeed;
  
  Spacerock() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-1, 1), random(-1, 1));
    velocity.rotate(random(0, TWO_PI));
    size = random(20, 80);
    lives = 1;
    direction = random(-.05, .05);
    turnspeed = random(-.05, .05);
  }

  //NEW
  Spacerock(float s, float x, float y) {
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    velocity.rotate(random(0, TWO_PI));
    size = s;
    direction = random(-.05, .05);
    turnspeed = random(-.05, .05);
  }

  void show() {
    pushMatrix();
    
    translate(location.x, location.y);
    rotate(direction);
    direction += turnspeed;
    
    rect(0, 0, size, size);
    popMatrix();
  }

  void act() {
    super.act();

    if (location.x > width + size/2) location.x = 0 - size/2;
    if (location.x < 0 - size/2) location.x = width + size/2;
    if (location.y > height + size/2) location.y = 0 - size/2;
    if (location.y < 0 - size/2) location.y = height + size/2;

    if(dist(location.x, location.y, myShip.location.x, myShip.location.y) <= size/2 + 8){
      if(livestimer > 60){
        myShip.lives--;
        livestimer = 0;
      }
    }

    //NEW
    int i = 0;
    while (i <myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          myObj.lives = 0;
          lives = 0;
          if (size > 20) {
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
