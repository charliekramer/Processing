float circleX;
float xspeed = 2;
float circleY;
float yspeed = 2;

void setup() {
  size(640, 360);
  circleX = 0;
  fill(102);
 
}

void draw() {

  stroke(255);
  ellipse(circleX, circleY, 32,32);
  circleX = circleX + xspeed;
  circleY = circleY + yspeed;
  if (circleX >= width || circleX <= 0)  {
    xspeed = -xspeed;
    fill(random(255), random(255), random(255));
    
  }
  if (circleY >= height || circleY <= 0)  {
    yspeed = -yspeed;
    fill(random(255), random(255), random(255));
  }
  
}

void mousePressed () {
    background(50);
}
