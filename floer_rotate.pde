// up key, down key = change radius
// click mouse = redraw

float centerX = width/2;
float centerY = height/2;
float deltaX = 0;
float deltaY = 0;
float maxDeltaX = 300;
float minDeltaX = 150;
float deltaMult = 2;
float radius = height/3;
float rad = radius; //for randomization
float minRad = height/40;
float maxRad = height/2;
float petalSize = height/8;
float a = sqrt(radius*radius/8);
int mousefollow = 0;
float j = 0;


void setup() {
  size(1460, 720);
  background(250);
  centerX = width/2;
  centerY = height/2;
  radius = height/3;
  petalSize = height/8;
  a = sqrt(radius*radius/8);
 
  
}

void draw() {
  j++;
  translate(width/2,height/2);
  centerX = 0;
  centerY = 0;
  pushMatrix();
  rotate(.01*j*PI);
  radius = 15*sin(j/100)*rad;
  petalSize = radius*3/8;
  a = sqrt(radius*radius/8);

  ellipse(centerX, centerY, radius, radius);
  fill(random(255), random(255), random(255));
  
  ellipse(centerX, centerY+radius/2, petalSize, petalSize);
  fill(125,0,125);
  ellipse(centerX+radius/2, centerY, petalSize, petalSize);
  fill(random(255), random(255), random(255));
  ellipse(centerX, centerY-radius/2, petalSize, petalSize);
  fill(255, 0, 0);
  ellipse(centerX-radius/2, centerY, petalSize, petalSize);
  fill(0,0,255);
  ellipse(centerX-a, centerY-a, petalSize, petalSize);
  fill(random(255), random(255), random(255));
  ellipse(centerX-a, centerY+a, petalSize, petalSize);
  fill(random(255), random(255), random(255));
  ellipse(centerX+a, centerY-a, petalSize, petalSize);
  fill(0,255,0);
  ellipse(centerX+a, centerY+a, petalSize, petalSize);
  fill(random(255), random(255), random(255));
  delay(25);
  popMatrix();
  
}

void mousePressed () {
  background(250);
}
void keyPressed () {
  if (keyCode == UP) rad++;
  if (keyCode == DOWN) rad--;
  if (rad <= minRad) rad = minRad;
  if (rad >= maxRad) rad = maxRad;
}
  
