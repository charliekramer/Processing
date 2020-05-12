// SimpleMidi.pde

import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; 
import processing.sound.*;

MidiBus myBus; 
TriOsc triOsc;
Reverb reverb;
Env env;

float attackTime = 0.001;
float sustainTime = 0.004;
float sustainLevel = 0.3;
float releaseTime = 0.2;

int midiDevice  = 0;
int rows;
int cols;
float [][] current;
float [][] previous;
float t = 1; // use to drive sin, etc
float dt = .01; // for color rotation
float dampening = .99999999;// .999999999999999999 for binaryII
float randCutoff= .99999; // prob of random drop


void setup() {
  size(600, 450);
  //fullScreen();
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1); 
  cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];
  
  triOsc = new TriOsc(this); 
  env = new Env(this);
  reverb = new Reverb(this);
  reverb.room(.8);
  reverb.damp(.1);
  reverb.wet(.7);
  reverb.process(triOsc);
}

void mouseDragged() {
  previous[max(min(mouseX,width-1),1)][max(min(mouseY, height-1),1)] = 500;
}

void draw() {
  background(0);
  
  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      current[i][j] = (
        previous[i-1][j] +
        previous[i+1][j] +
        previous[i][j-1] +
        previous[i][j+1]) / 2 - // 2;cool effects at 1, .5
        1*current[i][j]; // 1; 1.5 cool
      current[i][j] = current[i][j] * dampening;
      if(random(1) > randCutoff) current[i][j] = 500;
      int index = i + j*cols;
      pixels[index] = color( abs( cos(t) )*current[i][j], abs( sin(t) )*current[i][j], abs( tan(t) )*current[i][j] );
      }
    }
    updatePixels();
    
    float[][] temp = previous;
    previous = current;
    current = temp;
    
    t = t + dt;
    
    if(mousePressed) previous[max(min(mouseX, width-1),1)][max(min(mouseY, height-1),1)] = 500;
    
  }
  
  
void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int msg = (int)(message.getMessage()[0] & 0xFF) ;
  int note = (int)(message.getMessage()[1] & 0xFF) ;
  int vel = (int)(message.getMessage()[2] & 0xFF);

  //println("Bus " + bus_name + " msg" +msg+ ": Note "+ note + ", vel " + vel);
  if (vel > 0 && msg == 144) {
    previous[floor(map(note,0,127,40,random(.8,.9)*width))][floor(map(note,0,127,10,random(.8,.9)*height))] = 500;
    
   //previous[int(random(width))][int(random(height))] = 500;
    //triOsc.play(midiToFreq(note), 0.5);
    //env.play(triOsc, attackTime, sustainTime, sustainLevel, releaseTime);
  }
}

float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
}
