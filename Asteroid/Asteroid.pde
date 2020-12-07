import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer intro, win, gameover, theme, shoot, damage, explosion;

boolean w, a, s, d, space;
int mode, btimer, livestimer, i, ufobtimer, rockcount, ufocount;
float ufospawner, ufodirection;
Spaceship myShip;
UFO myUFO;
Bullet myBullet;
SpacerockP myParticles;
ArrayList<GameObject>myObjects;
PFont font;

final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WIN = 4;

void setup() {
  i = 0;
  size(800, 800);
  myShip = new Spaceship();
  myObjects = new ArrayList<GameObject>();
  while (i < 10) {
    myObjects.add(new Spacerock());
    i++;
  }

  btimer = 0;
  ufobtimer= 0 ;
  livestimer = 1;
  frameRate(75);
  ufospawner = 0;

  font = createFont("game_over.ttf", 100);

  //##### Audio ######
  minim = new Minim(this);
  theme = minim.loadFile("Theme.mp3");
  intro = minim.loadFile("Intro.mp3");
  shoot = minim.loadFile("Shoot.wav");
  damage = minim.loadFile("damage.wav");
  win = minim.loadFile("Victory.mp3");
  gameover = minim.loadFile("Defeat.mp3");
  explosion = minim.loadFile("explosion.wav");
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
  } else if (mode == WIN) {
    win();
  } else {
    println("mode is " + mode );
  }
}
