class Fire extends GameObject {
  float alpha;

  Fire() {
    location = myShip.location.copy();
    velocity = myShip.direction.copy();
    velocity.rotate(radians(180) + random(-0.25, 0.25));
    velocity.setMag(10);
    size = random(5, 10);
    lives = 1;
    alpha = 150;
  }

  void show() {
    strokeWeight(2);
    stroke(255, alpha);
    fill(0, alpha);  
    rect(location.x, location.y, size, size);
    alpha = alpha - 10;
    if (alpha < 0) lives = 0;
  }
}
