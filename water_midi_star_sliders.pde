// SimpleMidi.pde

import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; 
import processing.sound.*;
import controlP5.*;

MidiBus myBus; 
ControlP5 cp5;
int rMax; // maximum rand pixel reset on key press
int circleBack; // circle back to this value when pixel < o;

int midiDevice  = 0;
int rows;
int cols;
float [][] current;
float [][] previous;
float t = 1; // use to drive sin, etc
float dt = .01; // for color rotation
float dampening = .999999;// .999999999999999999 for binaryII
float randCutoff= .999999; // prob of random drop


void setup() {
  size(400, 300);
  //fullScreen();
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1); 
  cp5 = new ControlP5(this);
  cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];
  cp5.addSlider("rMax")
     .setPosition(0,0)
     .setSize(10,200)
     .setRange(1,500)
     .setValue(250)
     .setColorCaptionLabel(color(20,20,20));
  
 }

void mouseDragged() {
  previous[max(min(mouseX,width-1),1)][max(min(mouseY, height-1),1)] = 500;
}

void draw() {
  background(0);
  
  circleBack = 500;
  
  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      /*
      current[i][j] = (
        previous[i-1][j]*(1+sin(t)*.05) +
        previous[i+1][j]*(1+sin(t)*.05) +
        previous[i][j-1]*(1+cos(t)*.05) +
        previous[i][j+1]*(1+cos(t)*.05) ) / 2 - // 2;cool effects at 1, .5
        1*current[i][j]; // 1; 1.5 cool
        */
        /*
       current[i][j] = (
        previous[i-1][j] +
        previous[i+1][j] +
        previous[i][j-1] +
        previous[i][j+1] ) / (2*(1+sin(t)*.1)) - // 2;cool effects at 1, .5
        1*current[i][j]; // 1; 1.5 cool
     */
     current[i][j] = (
        previous[i-1][j] +
        previous[i+1][j] +
        previous[i][j-1] +
        previous[i][j+1] ) / (2) - // 2;cool effects at 1, .5
        1*current[i][j]; // 1; 1.5 cool
     
      current[i][j] = current[i][j] * dampening;
      if (current[i][j] > circleBack ) current[i][j] = circleBack - (current[i][j]-circleBack) ;
      if (current[i][j] < 0   ) current[i][j] = -current[i][j] ;
      
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
    
    if(mousePressed) {
          previous[max(min(mouseX, width-1),1)][max(min(mouseY, height-1),1)] = 500;
    }
    if (keyPressed) {
      background(0);
      for (int i = 1; i < cols-1; i++) {
        for (int j = 1; j < rows-1; j++) {
          previous[i][j] = int(random(random(rMax)));
        }
      }
 
    }
  }
  
  
void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int msg = (int)(message.getMessage()[0] & 0xFF) ;
  int note = (int)(message.getMessage()[1] & 0xFF) ;
  int vel = (int)(message.getMessage()[2] & 0xFF);

  //println("Bus " + bus_name + " msg" +msg+ ": Note "+ note + ", vel " + vel);
  if (vel > 0 && msg == 144) {
    previous[floor(map(note,0,127,40,random(.8,.9)*width))][floor(map(note,0,127,10,random(.8,.9)*height))] = 500;
    
  }
}

float midiToFreq(int note) {
  return (pow(2, ((note-69)/12.0))) * 440;
}
