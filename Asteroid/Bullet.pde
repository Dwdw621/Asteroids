class Bullet extends GameObject {
  Bullet() {
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    size = 6;
    lives = 1;
  }

  void act() {
    super.act();
    if (location.x > width+size/2 || location.x < 0 - size/2 ) lives = 0;
    if (location.y > height+size/2 || location.y < 0 - size/2 ) lives = 0;
  }
}
