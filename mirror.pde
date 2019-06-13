
float x1 = 35;
float y1 = 45;
float radius = 15;
float ybar, xbar, xt, yt;
float t = 0;
float phase; //for color rotation


void setup () {
  size(800, 500);
  background(255);
  ybar = height/2;
  xbar = width/2;
  xt = x1 +2*(xbar-x1);
  yt = y1 +2*(ybar-y1);
  phase = 0;
  }

void draw() {
 // x1 = mouseX;
 // y1 = mouseY;
 // x1 = random(width);
 // y1 = random(height);
 t++;
 radius = sin(t*.005)*25;
 stroke(255);;
  
  
  xt = x1 +2*(xbar-x1);
  yt = y1 +2*(ybar-y1);
  fill(random(255),random(255), random(255), random(255));
  fill(sin(t*.1+PI/3)*255,sin(t*.1)*255,sin(t*.1+2*PI/3)*255);
  ellipse(x1, y1, radius, radius);
  ellipse(xt, y1, radius, radius);
  ellipse(x1, yt, radius, radius);
  ellipse(xt, yt, radius, radius);
  x1 = x1+random(-1,3);
  y1 = y1+random(-1,3);
  if (x1 > width) x1 = 0;
  if (x1 < 0) x1 = width;
  if (y1 > height) y1 = 0;
  if (y1 < 0) y1 = height;
  if(mousePressed) background(255);
  
}
