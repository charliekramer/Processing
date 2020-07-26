// splotch on page
// version 3
//  quadratic vertex
// makeeach splotch unfurl 
// fuzzing pixels using loadpixel (w/ cosine drive)
// send osc signals

import oscP5.*;
import netP5.*;

float t = 0; //oscillate random size of splotch;
float dt = .1;

int n = 0;

int nVertex = 250;
int maxVertex = 500;
float[] xX;
float[] yY;

float vol, pitch, pan;

float r, g, b;

OscP5 oscP5;
NetAddress dest;

void setup () {
  
  size(900,500);
  colorMode(RGB);
  translate(width/2, height/2);
  xX = new float[maxVertex];
  yY = new float[maxVertex];
  r = random(255);
  g = random(255);
  b = random(255);
  
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);
  
  
}

void draw() {
  //background(0);
  fill(125*(1+sin(t/100)),9);
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
      if (xX[i] > width) xX[i] = 0;
      if (xX[i] < 0) xX[i] = width;
      if (yY[i] > height) yY[i] = 0;
      if (yY[i] < 0) yY[i] = height;
      
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
  
  loadPixels();
  float avgBright = 0;
  for (int i = 0; i < width*height; i++) {
    pixels[i] *= random(.999,1.001)*(1+cos(t/20));
    avgBright += brightness(pixels[i])/( width*height);
  }
  updatePixels();
  
  vol = map(avgBright, 0, 255, 0.1, 1);
  pitch = map(yY[n % nVertex], 0, height, 1, 0);
  pan  = map(xX[n % nVertex], 0, width, -1, 1);
  sendOsc();
  
  
  delay(int(random(25)));
  n ++;
}


void sendOsc() {
 
   OscMessage msg = new OscMessage("/splotch_v5/volPitchPan");
      msg.add(vol);
      msg.add(pitch);
      msg.add(pan);
  oscP5.send(msg, dest);
  println("vol ", vol, " pitch ", pitch, "pan", pan);
}
