// splotch on page
// version 3
//  quadratic vertex
// how to makeeach splotch unfurl separately?

float t = 0; //oscillate random size of splotch;
float dt = .1;

int n = 0;

int nVertex = 250;
int maxVertex = 500;
float[] xX;
float[] yY;

float r, g, b;

void setup () {
  
  size(900,500);
  colorMode(RGB);
  translate(width/2, height/2);
  xX = new float[maxVertex];
  yY = new float[maxVertex];
  r = random(255);
  g = random(255);
  b = random(255);
  
}

void draw() {
  //background(0);
  fill(255,9);
  noStroke();
  rect(0,0, width, height);
  float x = random(0,width);
  float y = random(0,height);
  float x0 = x;
  float y0 = y;
  float x1 = x;
  float y1 = y;
  fill(102);
  stroke(255);
  strokeWeight(2);
  
  float randSize = (1+sin(t))*10;
 
  if (n % nVertex == 0) {  // reinitialize x,y;
    xX[0] = random(width);
    yY[0] = random(height);
    nVertex = int(random(2,maxVertex));
    for (int i = 1; i < nVertex; i++) {
      xX[i] = xX[i-1] + random(-randSize, randSize);
      yY[i] = yY[i-1] + random(-randSize, randSize);
      r = random(255);
      g = random(255);
      b = random(255);
      t += dt;
    }
  }
  
  
  beginShape();
   fill(r,g,b);
   
   //noStroke();
  for (int i = 0; i < n % nVertex; i++) { 
    curveVertex(xX[i],yY[i]);   
  }
  
  curveVertex(xX[0],yY[0]);
  
  endShape();
  
  
  delay(int(random(25)));
  n ++;
}
