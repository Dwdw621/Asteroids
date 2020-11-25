//Common things among all classes
class GameObject {
  PVector location;
  PVector velocity;
  float size;
  int lives;

  GameObject() {
  }

  void show() {
    ellipse(location.x, location.y, size, size);
    stroke(255);
    fill(0);
    strokeWeight(2);
  }

  void act() {
    location.add(velocity);
  }
}
