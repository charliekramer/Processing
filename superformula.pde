
// https://www.youtube.com/watch?v=u6arTXBDYhQ
// https://www.youtube.com/watch?v=LaarVR1AOvs
// https://www.youtube.com/watch?v=f5QBExMNB1I

void setup() {
  size(500,500);
  
  noFill();
  stroke(255);
  strokeWeight(2);
  
}

float t = 0;

void draw() {
  background(0);
  
  translate(width/2, height/2);
  
   float aR = random(.1,1.1);
  float bR = random(.9,1.1);
  float mR = random (7,7);
  float n1R = random(.9,1.1);
  
  beginShape();
  
  for (float theta = 0; theta <=  2*PI; theta += 0.01){
    float rad = r(theta, 
      aR, //a 2
      bR, //b 2
      mR, //m 6
      n1R, // n1; 1
      sin(t)*.5 + 0.5, //n2
      cos(t)*.5 + 0.5 ); //n3
    float x = rad*cos(theta)*50;
    float y = rad*sin(theta)*50;
    vertex(x, y);
  }
  
  //
  
  endShape();
  
 
  
  t += 0.1;
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(pow(abs( (cos(m* theta / 4.0)/a ) ), n2) + pow(abs( (sin(m* theta / 4.0)/b ) ), n3), (-1./n1));
}
