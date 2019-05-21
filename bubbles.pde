
float radius;
float x = 0;
float y = 0;
float j = 0;


void setup () {
  size(650, 360);
  fill(255);
  background(125);
}

void draw() {

  
  background(125);
  noFill();
 // stroke(255);
    stroke(j, 255-j, 125+j);
  for (float j = 0; j < 20; j++) {
     ellipse(x,y, radius+j*15, radius+j*15);
  }
  radius++;
  if (radius >= sqrt(sq(width)+sq(height))) {
    radius = 0;
    background(125);
    j = random(255);
  }
  j++;
  if (j > 255) j = random(255);
}

 void mousePressed () {
  x = mouseX;
  y = mouseY;
}
