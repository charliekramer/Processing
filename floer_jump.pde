float centerX = 15;
float centerY = 15;
float deltaX = 150;
float deltaY = 150;
float maxDeltaX = 300;
float minDeltaX = 150;
float deltaMult = 2;
float radius = height/3;
float rad = radius; //for randomization
float minRad = height/40;
float maxRad = height/2;
float petalSize = height/8;
float a = sqrt(radius*radius/8);
int mousefollow = 1;


void setup() {

  size(1460, 720);
  background(250);
  
}

void draw() {
 // background(250);
  radius = random(rad/2, rad*10);
  a = sqrt(radius*radius/8);
  petalSize = radius*3/8;
  if (mousefollow == 1) {
    centerX = mouseX;
    centerY = mouseY;
  }
  pushMatrix();
  rotate(.2*PI);
  
  ellipse(centerX, centerY, radius, radius);
  ellipse(centerX, centerY+radius/2, petalSize, petalSize);
  ellipse(centerX+radius/2, centerY, petalSize, petalSize);
  ellipse(centerX, centerY-radius/2, petalSize, petalSize);
  ellipse(centerX-radius/2, centerY, petalSize, petalSize);
  ellipse(centerX-a, centerY-a, petalSize, petalSize);
  ellipse(centerX-a, centerY+a, petalSize, petalSize);
  ellipse(centerX+a, centerY-a, petalSize, petalSize);
  ellipse(centerX+a, centerY+a, petalSize, petalSize);
  centerX = centerX + deltaX;
  fill(random(255), random(255), random(255));
   popMatrix();
   delay(100);
  if (centerX >= width) {
    centerX = 15;
    centerY = centerY+deltaY;
  }
  if (centerY >= height) {
    centerX = 15;
    centerY = 15;
    if (deltaX < minDeltaX || deltaX > maxDeltaX) deltaMult = 1/deltaMult;
    deltaX = deltaX / deltaMult;
    deltaY = deltaY / deltaMult;
   // background(250);
  }
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
  
