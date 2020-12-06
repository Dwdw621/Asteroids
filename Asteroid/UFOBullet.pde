class UFOBullet extends GameObject {
  float x, y, a, b;

  UFOBullet(float x, float y, float a, float b) {
    location = new PVector(x, y);
    velocity = new PVector(a, b);
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
