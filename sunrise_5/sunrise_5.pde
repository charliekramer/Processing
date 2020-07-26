//float xpos, ypos,speed, radius;
//Sun s1 = new Sun(random(0,width), random(height,height/2), random(-2,-.1) ,random(100));

import processing.sound.*;

SinOsc[] osc; 

Delay delay;
float delayTime = 0.75;
float delayFeedback = 0.8;

float masterVol = .5;

float bgColor;
float t = 0;
float dt = 0.005;

int nSun;
int nOsc;
float maxRadius;
Sun[] sun;
float alpha;
float dAlpha = 1;
float[] oscVol;
int nMidi = 10;
float[] midiNotes;

void setup() {

  size(900,400, P3D);
  
  nSun = 12;
  nOsc = nSun;
  osc = new SinOsc[nOsc];
  oscVol = new float[nOsc];
   
  delay = new Delay(this);
  delay.feedback(delayFeedback);
  delay.time(delayTime);
  
  maxRadius = 100;
  
  sun = new Sun[nSun];
  for (int i = 0; i < nSun; i++) {
    osc[i] = new SinOsc(this);
    osc[i].play();
    oscVol[i] = masterVol/nOsc;
    osc[i].amp(oscVol[i]);   
    delay.process(osc[i], delayTime);
    
    sun[i] = new Sun(random(0,width), random(height,height/2), random(-2,-.1),random(maxRadius));
  } 
  alpha = 5;
  
  midiNotes = new float[nMidi];
  
  midiNotes[0] = 48; // root
  midiNotes[1] = 50; // 2nd
  midiNotes[2] = 52; // M3
  midiNotes[3] = 53; // 4
  midiNotes[4] = 55; // 5
  midiNotes[5] = 57; // 9
  midiNotes[6] = 59; // 11
  midiNotes[7] = 60; // octave
  midiNotes[8] = 62; // 2nd
  midiNotes[9] = 64; // 3nd

}

void draw() {

delay.feedback(delayFeedback*(255-alpha)/255);
  
//background(0,0,255);
t += dt;
bgColor = 255*(1+sin(t))/2;
fill(0,0,bgColor,alpha);
rect(0,0,width,height);
delay.time(delayTime);

 for (int i = 0; i < nSun; i++) {
    sun[i].update();
    //osc[i].freq(midiToFreq(  map(sun[i].xPos(), 0, width, 48, 60)  )  );
    osc[i].freq( 
                midiToFreq(  
                          midiNotes[
                                    xPick( 
                                          int(
                                            sun[i].xPos()
                                            )
                                            , nMidi)
                                            ]  
                                       
                             )
                   );
    
    osc[i].amp(oscVol[i]*pow(sun[i].yPos()*sun[i].Radius()/(height*maxRadius),2));
    osc[i].pan((sun[i].xPos()-width/2)/( width/2));
  }
 
fill(0);
rect(0,height-50,width,50);

if (mousePressed) {
  alpha += dAlpha;
  println("alpha, " , alpha);
}
if (alpha > 125  || alpha < 0) dAlpha *= -1;
  
}
class Sun { 
  float xpos, ypos, speed,radius; 
  
  Sun (float x, float y, float s,float r) {  
    xpos = x;
    ypos = y; 
    speed = s; 
    radius = r;
  } 
  void update() { 
    ypos += speed; 
    if (ypos < 0) { 
      xpos = random(0,width);
      ypos = height; 
    } 
    fill(random(155,255),random(125,255),0);
    ellipse(xpos, ypos, radius, radius); 
  } 
  float xPos() {
    return xpos;
  }
  float yPos() {
    return ypos;
  }
  float Radius() {
    return radius;
  }
} 

float midiToFreq(float note) {
  return (pow(2., ((note-69.)/12.0))) * 440.;
}

int xPick(int xpos, int n) {
  int j=0;
  for (int i = 0; i < n; i++) {
     if (xpos > i*width/n && xpos < (i+1)*width/n) j = i;
  }
  return j;
}
  
