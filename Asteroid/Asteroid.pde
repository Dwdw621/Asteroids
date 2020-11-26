boolean w, a, s, d, space;
int mode, timer, livestimer;
Spaceship myShip;
ArrayList<GameObject>myObjects;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

void setup() {
  size(800, 800);
  myShip = new Spaceship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(new Spacerock());
  myObjects.add(new Spacerock());
  myObjects.add(new Spacerock());
  myObjects.add(new Spacerock());
  myObjects.add(new Spacerock());
  myObjects.add(new Spacerock());
  myObjects.add(new Spacerock());
  myObjects.add(new Spacerock());
  myObjects.add(new Spacerock());
  myObjects.add(new Spacerock());
  timer = 0;
  livestimer = 0;
  frameRate(75);
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("mode is " + mode );
  }
}
