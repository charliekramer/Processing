float centerX = 5;
float centerY = 5;
float deltaX = 150;
float deltaY = 150;
float maxDeltaX = 300;
float minDeltaX = 150;
float deltaMult = 2;
float radius = height/3;
float petalSize = height/8;
float a = sqrt(radius*radius/8);


void setup() {

  size(720, 360);
  background(250);
  
}

void draw() {
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
    rotate(random(2)*PI);
   // background(250);
  }
}
