
void setup() {
  size(400, 300);
background(0);
}



void draw() {

  strokeWeight(2);
  stroke(255);
  fill(127);
  
  for (int y = 0; y< height; y = y + 20) {
    for (int x = 0; x< width; x = x + 20) {
      fill(random(256));
      rect(x, y, 20, 20);
    }
  }
}
