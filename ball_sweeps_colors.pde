
int chunks = 10;
float t = 0;
float dt = .001;

import processing.sound.*;
import controlP5.*;

SinOsc[] sineWaves; 
ControlP5 cp5;

int numSines = (chunks)*(chunks);

float[] sineVolume;

float freqMult = 2.5; // 2,.5, 22.5 are interesting)

float rateMult = 1000;

float delayTime = 0.5;
float delayFeedback = 0.8;

Delay delay;


void setup() {

size(1200,900);//600,400
background(0);
cp5 = new ControlP5(this);
delay = new Delay(this);
delay.feedback(delayFeedback);
delay.time(delayTime);
 sineWaves = new SinOsc[numSines];
 sineVolume = new float[numSines];
 for (int i = 0; i < numSines; i++) {
   sineVolume[i] = (1 / numSines) / (i + 1);
   sineWaves[i] = new SinOsc(this);
   sineWaves[i].play();
   delay.process(sineWaves[i], delayTime);
   }
 
 cp5.addSlider("freqMult")
     .setPosition(0,0)
     .setSize(10,200)
     .setRange(.1,50)
     .setValue(1)
     .setColorCaptionLabel(color(20,20,20));
  
  
}

void draw() {
 for (int i = 0; i < chunks; i++) {
   for (int j = 0; j < chunks; j++) {
     fill((1+sin(t))*255/2*mouseX/width, (1+cos(t))*255/2*mouseY/height, (1+tan(t))*255/2);
     ellipse(width/chunks*.5 + width/chunks*i*sin(t),height/chunks*.5 + height/chunks*j*cos(t), 10, 10);
     sineWaves[i + j*chunks].freq(width/chunks*.5 + width/chunks*i*sin(t)*freqMult+height/chunks*.5 + height/chunks*j*cos(t)*freqMult);
   }
 }
  t += dt*mouseX/width*rateMult;
  if(mousePressed) {
    background(0);
    t = 0;
  }
  ellipse(width/2,height/2,10*sin(t),10*cos(t));
  
}
