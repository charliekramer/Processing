float i=0;
float x = 0;
float y = 0;
float z = 1 ;
float v = 20;
float nCircles = 200; // number of circles to draw
float xRange = .1; // range for starting value of circle series
float yRange = 1; //  (e.g. percent of range nearest origin)
void setup () {


  size(1440, 900);
  line(100, 50, 600, 250);
  background(255);
}

void draw() {
  i=i+1;
  pushMatrix();
  rotate(radians(2*i*(1+z)/100*PI));
  ellipse(x+5*i, y+5*i, v, v);
  popMatrix();

  if (i == nCircles) {
    i = 0;
    x = random(width*xRange);
    y = random(height*yRange);
    fill (random(255), random(255), random(255));
    z = random(-75, 75);
    v = random(10,75);
  }
}

void mousePressed () {
  background(255);
}
