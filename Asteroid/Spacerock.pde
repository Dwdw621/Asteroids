class Spacerock extends GameObject {
  Spacerock() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-1.5, 1.5), random(-1.5, 1.5));
    velocity.rotate(random(TWO_PI));
    size = random(10, 50);
    lives = 1;
  }

  void show() {
    rect(location.x, location.y, size, size);
  }

  void act() {
    super.act();
    if (location.x > width + size/2) location.x = 0 - size/2;
    if (location.x < 0 - size/2) location.x = width + size/2;
    if (location.y > height + size/2) location.y = 0 - size/2;
    if (location.y < 0 - size/2) location.y = height + size/2;
  }
}
