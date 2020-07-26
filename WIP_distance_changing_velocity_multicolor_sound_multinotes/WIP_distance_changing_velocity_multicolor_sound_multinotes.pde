// color intensity is proportional to two randomly moving points
// control r, g, b via sliders
// send osc code to ChucK for fun; works with distance_p5.ck
// maybe add opacity?
// output frequency ranges from zero to one, need to rescale in chuck

float t = 0;
float dt = .05;
int nNodes = 5;
float[] x;
float[] y;
float[] dx;
float[] dy;
float[] speed;
float r = .2; //weights on red green and blue //.27, .19, .2 is cool
float g = .2; // make these sliders
float b = .2; // in HSB mode these are hue, sat, bright
float a = 125;
float vol;
float pitch;
float pan;

import oscP5.*;
import netP5.*;
import controlP5.*;
ControlP5 cp5;

OscP5 oscP5;
NetAddress dest;

void setup() {
  //size(900, 450);
  //fullScreen();
  size(1240,500);
  colorMode(HSB,255);
  x = new float[nNodes];
  y = new float[nNodes];
  dx = new float[nNodes]; 
  dy = new float[nNodes];
  speed = new float[nNodes];
  
  //ellipse(20,20,random(width), random(height));
  for (int i = 0; i < nNodes; i++) {
    x[i] = random(width);
    y[i] = random(height);
    dx[i] = 1;
    dy[i] = 1;
    speed[i] = i+1;
  }
  cp5 = new ControlP5(this);
   
  cp5.addSlider("r")
     .setPosition(0,0)
     .setSize(10,200)
     .setRange(.0,.5)
     .setValue(0.)
     .setColorCaptionLabel(color(20,20,20));
     
  cp5.addSlider("g")
     .setPosition(width-200,height-10)
     .setSize(200,10)
     .setRange(.0,.5)
     .setValue(.0)
     .setColorCaptionLabel(color(40,40,40));
    
   cp5.addSlider("b")
     .setPosition(0,height-10)
     .setSize(200,10)
     .setRange(.0,.5)
     .setValue(.0)
     .setColorCaptionLabel(color(40,40,40));
     
     oscP5 = new OscP5(this,9000);
    dest = new NetAddress("127.0.0.1",6448);
    
     cp5.addSlider("a")
     .setPosition(width/2,height-10)
     .setSize(200,10)
     .setRange(0,255)
     .setValue(125)
     .setColorCaptionLabel(color(40,40,40));
     
     oscP5 = new OscP5(this,9000);
    dest = new NetAddress("127.0.0.1",6448);
  
  
}


void draw() {
  loadPixels();
  float avBright = 0;
  float dist = 0;
  
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int k = i + j*width;
      dist = 0;
      for (int n = 0; n < nNodes; n++) {
        dist += dist(i,j,x[n],y[n]);
      }
        float powMult = .0005; //.0005 and 2 is a good combo; 0.05 and 1.5
        float exp = 2; // change powmult when change exp
      pixels[k] = color( 
        powMult*r*pow(dist,exp),
        powMult*g*pow(dist,exp),
        powMult*b*pow(dist,exp),
        a
        );
        avBright += brightness(pixels[k])/(width*height);
    }
  }
  updatePixels();
  t += dt;
  
  float avgX = 0;
  float avgY = 0;
  
  for (int n = 0; n < nNodes; n++) {
    avgX += x[n]/nNodes;
    avgY += y[n]/nNodes;
  }
  
 
  //vol = map(avBright, 0, sqrt(height*height + width*width), 1, 0);
  vol = map(avBright, 0, 256, 1, .1);
  println("avBright ", avBright, " vol ", vol);
  pitch = map(avgY, 0, height, 1, 0);
  pan  = map(avgX, 0, width, -1, 1);
  sendOsc();
  
  for (int n = 0; n < nNodes; n++) {
   /*
    x[n] += random(0,2*(1+sin(t)))*dx[n];// might have to go even/odd sin/cos like in 2x2   
    y[n] += random(0,2*(1+cos(t)))*dy[n];
   */
   int isOdd = n % 2;
    x[n] += random(0,speed[n]*(isOdd*(1+sin(t)) + (1-isOdd)*(1+cos(t)) ))*dx[n];// might have to go even/odd sin/cos like in 2x2   
    y[n] += random(0,speed[n]*(isOdd*(1+cos(t)) + (1-isOdd)*(1+sin(t)) ))*dy[n];// might have to go even/odd sin/cos like in 2x2   
     
   if (x[n] > width || x[n] < 0) dx[n] *= -1; 
   if (y[n] > height || y[n] < 0) dy[n] *= -1; 
  }
   
}

void sendOsc() {
 
   OscMessage msg = new OscMessage("/distance/volPitchPan");
      msg.add(vol);
      msg.add(pitch);
      msg.add(pan);
  oscP5.send(msg, dest);
  //println("vol ", vol, " pitch ", pitch, "pan", pan);


}
