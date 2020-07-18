// color intensity is proportional to two randomly moving points
// control r, g, b via sliders
// send osc code to ChucK for fun; works with distance_p5.ck
// maybe add opacity?
// output frequency ranges from zero to one, need to rescale in chuck

float t = 0;
float dt = .05;
float x1;
float x2;
float y1;
float y2;
float dx1 = 1;
float dx2 = 1;
float dy1 = 1;
float dy2 = 1;
float r = .2; //weights on red green and blue
float g = .2; // make these sliders
float b = .2;
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
  size(900, 450);
  //ellipse(20,20,random(width), random(height));
  x1 = random(width);
  y1 = random(height);
  x2 = random(width);
  y2 = random(height);
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
  
  
}


void draw() {
  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int k = i + j*width;
      pixels[k] = color( 
        r*(dist(
        i, j, x1, y1 )
        + dist(
        i, j, x2, y2 )),
        g*(dist(
        i, j, x1, y1 )
        + dist(
        i, j, x2, y2 )),
        b*(dist(
        i, j, x1, y1 )
        + dist(
        i, j, x2, y2 ))
        );
        float powMult = .01; //.0005 and 2 is a good combo; 0.05 and 1.5
        float exp = 1.75; // change powmult when change exp
      pixels[k] = color( 
        powMult*r*(pow(dist(
        i, j, x1, y1 )
        + dist(
        i, j, x2, y2 ),exp)),
        powMult*g*(pow(dist(
        i, j, x1, y1 )
        + dist(
        i, j, x2, y2 ),exp)),
        powMult*b*(pow(dist(
        i, j, x1, y1 )
        + dist(
        i, j, x2, y2 ),exp))
        );
    }
  }
  updatePixels();
  t += dt;
  x1 += random(0,2*(1+sin(t)))*dx1;
  x2 -= random(0,2*(1+cos(t)))*dx2;
  y1 += random(0,2*(1+sin(t)))*dy1;
  y2 -= random(0,2*(1+cos(t)))*dy2;
  
  if (x1 > width || x1 < 0) dx1 *= -1; 
  if (x2 > width || x2 < 0) dx2 *= -1;
  if (y1 > height || y1 < 0) dy1 *= -1; 
  if (y2 > height || y2 < 0) dy2 *= -1;

  vol = map(dist(x1,y1,x2,y2), 0, sqrt(height*height + width*width), 1, 0);
  pitch = map((y1+y2)/2, 0, height, 1, 0);
  pan  = map((x1+x2)/2, 0, width, -1, 1);
  sendOsc();
   
}

void sendOsc() {
 
   OscMessage msg = new OscMessage("/distance/volPitchPan");
      msg.add(vol);
      msg.add(pitch);
      msg.add(pan);
  oscP5.send(msg, dest);
  println("vol ", vol, " pitch ", pitch, "pan", pan);
}
