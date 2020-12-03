class SpacerockP extends GameObject {
  float alpha;

  SpacerockP(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    size = random(5, 10);
    lives = 1;
    alpha = 150;
  }

  void show() {
    strokeWeight(2);
    stroke(255, alpha);
    fill(0, alpha);  
    rect(location.x, location.y, size, size);
    alpha = alpha - 3;
    if (alpha < 0) lives = 0;
  }
}
