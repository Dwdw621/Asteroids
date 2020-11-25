void game() {
  background(0);
  
  //####################BULLETS####################
  int i = 0;
  while(i < myObjects.size()){
    GameObject obj = myObjects.get(i); //Go to certain 'page'
    if(obj.lives > 0){
      obj.act();
      obj.show();
      i++;
    }else{
     myObjects.remove(i); 
    }
  }
  
  myShip.show();
  myShip.act();
  
  timer++;
  if(timer > 5) timer = 0;
}

void keyPressed(){
    if(key == 'd' || key == 'D'){d = true;}
    if(key == 'a' || key == 'A'){a = true;}
    if(key == 'w' || key == 'W'){w = true;}
    if(key == 's' || key == 'S'){s = true;}
    if(keyCode == 32){space = true;}
}
  
void keyReleased(){
    if(key == 'd' || key == 'D'){d = false;}
    if(key == 'a' || key == 'A'){a = false;}
    if(key == 'w' || key == 'W'){w = false;}
    if(key == 's' || key == 'S'){s = false;}
    if(keyCode == 32){space = false;}
} 
 
void gameClicks() {
  if (buttonPressed(750, 25, 100, 50)) {
    mode = PAUSE;
  }
  if (buttonPressed(400, 400, 100, 50)) {
    mode = GAMEOVER;
  }
}

  //button(750, 25, 100, 50, "Pause");
  //button(400, 400, 100, 50, "Win");
