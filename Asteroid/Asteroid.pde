boolean w, a, s, d, space;
int mode, btimer, livestimer, i, ufotimer;
Spaceship myShip;
UFO myUFO;
Bullet myBullet;
ArrayList<GameObject>myObjects;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

void setup() {
  i = 0;
  size(800, 800);
  myShip = new Spaceship();
  myObjects = new ArrayList<GameObject>();
  while (i < 12) {
    myObjects.add(new Spacerock());
    i++;
  }
  myObjects.add(new UFO());

  btimer = 0;
  ufotimer= 0 ;
  livestimer = 1;
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
