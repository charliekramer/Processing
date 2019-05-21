/**
 * Patterns. 
 * 
 * Move the cursor over the image to draw with a software tool 
 * which responds to the speed of the mouse. 
 */

float xpos = width/2;
float ypos = height/2;
float dx = 0;
float dy = 0;

float a = .95; // coefficient on x lagged
float b = .95; // coefficient on y lagged

int j = 0;

void setup() {
  size(1280, 720);
  background(102);
}

void draw() {
  j++;
  // Call the variableEllipse() method and send it the
  // parameters for the current mouse position
  // and the previous mouse position
  //  variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  dy = random(-10,10);
  dx = random(-10,10);
  ypos = a*ypos+ dy;
  xpos = b*xpos + dx;
  if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
   xpos = random(0,width);
   ypos = random(0,height);
  }
  variableEllipse(xpos, ypos, dx, dy);
  if (j % 200 == 0) {
    a = random(.96,1.05);
    b = random(.95,1.05);
    println("a b reset", a, b);
  }
}


// The simple method variableEllipse() was created specifically 
// for this program. It calculates the speed of the mouse
// and draws a small ellipse if the mouse is moving slowly
// and draws a large ellipse if the mouse is moving quickly 

void variableEllipse(float x, float y, float px, float py) {
//  float speed = abs(x-px) + abs(y-py);
//  stroke(speed);
  ellipse(x, y, px*px, py*py);
}
