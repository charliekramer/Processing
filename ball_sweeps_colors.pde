
int chunks = 10;
float t = 0;
float dt = .001;

import processing.sound.*;

SinOsc[] sineWaves; 

int numSines = (chunks)*(chunks);

float[] sineVolume;

float freqMult = 22.5; // 2,.5 are interesting)

float rateMult = 1000;

float delayTime = 0.5;
float delayFeedback = 0.8;

Delay delay;


void setup() {

size(600,400);
background(0);
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
