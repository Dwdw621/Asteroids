void button(int x, int y, int w, int h, String label) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    fill(155);
  } else {
    fill(255);
  }

  rectMode(CENTER);
  rect(x, y, w, h);
  strokeWeight(2);

  textSize(30);
  fill(0);
  textAlign(CENTER);
  text(label, x, y+h/4);
}

boolean buttonPressed(int x, int y, int w, int h) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2)
    return true;
  else
    return false;
}
