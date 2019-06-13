float t = 0;
float x1 = 50;
float y1 = 75;

float x2 = 50;
float y2 = 75;

float x1coeff = 10;
float y1coeff = 25;

float x2coeff = 17;
float y2coeff = 75;

void setup() {
  size(1340, 750);
  background(255);
  ellipse(50, 75, 5, 5); // endpoints of curve
  ellipse(100, 75, 5, 5);
  fill(255, 0, 0);
  ellipse(25, 25, 5, 5);  // control points
  ellipse(125, 25, 5, 5); 
  noFill();
  stroke(0);
  bezier(50, 75, 25, 25, 125, 25, 100, 75);
}

void draw() {
  //background(255);
   bezier(x1, y1, x1coeff*sin(t*.03*PI), y1coeff*sin(t*.01*PI-PI), x2coeff*cos(t*.03*PI), y2coeff*cos(t*.01*PI), x2, y2);
   t++;
   if(t%100 == 0) {
     //background(255);
     x1coeff = random(width);
     y1coeff= random(height);
     x2coeff = random(width);
     y2coeff= random(height);
     x1 = random(width);
     y1 = random(height);
     x2 = random(width);
     y2 = random(height);
     stroke(random(255), random(255), random(255));
     strokeWeight(random(7));
     
   }

  
}

void mousePressed() {
  background(255);
}
