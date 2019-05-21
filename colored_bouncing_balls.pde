float circleX;
float xspeed = 8;
float circleY;
float yspeed = 8;

void setup() {
  size(1280, 720);
  circleX = random(width);
  circleY = random(height);
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
    background(random(255),random(255),random(255));
}

void keyPressed () {
    circleX = random(width);
    circleY = random(height);
}
