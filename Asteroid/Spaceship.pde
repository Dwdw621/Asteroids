class Spaceship extends GameObject {
  //1. Instance variable (Values)
  PVector direction;
  int alpha;

  //2. Constructors (Set the values)
  Spaceship() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(.075, 0);
    lives = 192837465;
  }


  //3. Behavior functions (What does it look like. What does it do)
  void show() {
    pushMatrix();
    rectMode(CENTER);
    stroke(255, 255, 255, alpha);
    fill(0, 0, 0, alpha);
    translate(location.x, location.y); //Rotation needs to happen at origin
    rotate(direction.heading());
    triangle(-15, -6, -15, 6, 10, 0);
    if (w) { 
      triangle(-15, -2.5, -25, 0, -15, 2.5);
      myObjects.add(new Fire());
    }
    if (a) triangle(-15, 2.5, -20, 4.25, -15, 6);
    if (d) triangle(-15, -2.5, -20, -4.25, -15, -6);    
    popMatrix();
  }

  void act() {
    super.act();

    if (a) direction.rotate(-.05); 
    if (d) direction.rotate(.05);
    if (w) velocity.add(direction);
    if (s) velocity.sub(direction);
    if (velocity.x > 3) velocity.x = 3;
    if (velocity.y > 3) velocity.y = 3;
    if (velocity.x < -3) velocity.x = -3;
    if (velocity.y < -3) velocity.y = -3;
    if (velocity.mag() > 0) velocity.setMag(velocity.mag() - .025);
    if (space && btimer > 25) { 
      myObjects.add(new Bullet(location.x, location.y, direction.x, direction.y)); 
      btimer = 0;
    }

    if (location.x > width + 25) location.x = -25;
    if (location.x < 0 - 25) location.x = width + 25;
    if (location.y > height + 25) location.y = -25;
    if (location.y < 0 - 25) location.y = height + 25;

    if (lives <= 0) {
      mode = GAMEOVER;
    }

    if (livestimer < 60) {
      alpha = 100;
    } else {
      alpha = 255;
    }
  }
}
