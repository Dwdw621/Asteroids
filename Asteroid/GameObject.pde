//Common things among all classes
class GameObject {
  PVector location;
  PVector velocity;
  float size;
  int lives;

  GameObject() {
  }

  void show() {
    stroke(255, 255);
    ellipse(location.x, location.y, size, size);
    strokeWeight(2);
  }

  void act() {
    location.add(velocity);
  }
}
