float circleX;
float circleY;

void setup() {
  size(640, 360);
}

void draw() {
  
  circleX = random(0,width);
  circleY = random(0,height);

  
  //background(50);
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  ellipse(circleX, circleY, 24, 24);
  
}

void mousePressed () {
  background(102);
}
