float x, y;
float r;
float theta;
float thetaVel = .1;
float j = 0;
float r1 = 1;
float r2 = 1;
float rDelta = .99;


void setup() {
  size(710,400);
  r = height*.45;
  theta = 0;
  background(0);
}

void draw() { 
 // background(0);
  
  translate(width/2,height/2);
  
  x = r*cos(theta);
  y = r*sin(theta);
  
  ellipseMode(CENTER);
 // noStroke();
 // fill(200);
 noFill();
 stroke(255);
  ellipse(x,y, sin(theta*theta*r1)*32,cos(theta*theta*r2)*32);
  theta += thetaVel;
  j++;
  if (j % 100 == 0) {
    r1 = random(2);
    r2 = random(2);
  //  background (0);
  }
  r *= rDelta;
  if (r < 10 || r > width*.45) rDelta = 1/rDelta;
  
}
void mousePressed() {
    background (0);
}

  
  
