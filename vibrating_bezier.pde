void setup() {
  size(600,450,P3D);
  background(255);
}

float a1x, a1y, a2x, a2y; //anchor points
float c1x, c1y, c2x, c2y; //control points

void draw() {
  
  translate(width/2,height/2);
  rotateY(.0125*PI*frameCount/10);
  rotateX(.0125*PI*frameCount/10);
  //rotateZ(.0125*PI*frameCount/10);

  
  a1x = -width/2;
  a2x = width/2;
  a1y = -height/2;
  a2y = height/2;
  
  c1x = mouseX;
  c1y = mouseY;
  c2x = width/2-mouseX;
  c2y = height/2-mouseY;
  
  bezier(a1x, a1y, c1x, c1y, c2x, c2y, a2x, a2y);
}
