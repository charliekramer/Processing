// SimpleMidi.pde

import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; 

MidiBus myBus; 

int currentColor = 0;
int midiDevice  = 0;
int mNote;
int lastNote = 0;
int offOn = 0;
int mVel;
float k = 2;
int j = 0;
int isRand = 1; // randomness in triangles
int delayMs = 50; // delay in ms
float fadeRate = .01; // higher fade faster;

void setup() {
  size(1200, 650);
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1); 
  background(0);
  smooth();
  stroke(0,0,250,90);
  noFill();
}

void draw() {
  //background(0);
  //println("mNote,", mNote, "mVel,", mVel);
  //ellipse(mNote,mNote, 20, 20);
  fill(0,9);
  rect(0,0, width, height);
 
  if (offOn == 144) {
    noFill();
    stroke(0,0,255);
    triangle(mNote, mNote, mNote+k*mVel+isRand*random(5), mNote, mNote, mNote+k*mVel+isRand*random(5));
    pushMatrix();
    rotate(random(.1)*PI);
    translate(width/4,height/4);
    triangle(mNote, mNote, mNote+k*mVel+isRand*random(5), mNote, mNote, mNote+k*mVel+isRand*random(5));
    popMatrix();
  }
  
  k *= -1;
  lastNote = mNote;
  delay(delayMs);
  
}

void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int offOnMsg = (int)(message.getMessage()[0] & 0xFF) ;  
  int note = (int)(message.getMessage()[1] & 0xFF) ;
  int vel = (int)(message.getMessage()[2] & 0xFF);

  //println("Bus " + bus_name + ": Note "+ note + ", vel " + vel);
 // if (vel > 0 ) {
  //  fill(255);
  // ellipse(note, note, 10, 10);
  //}
  mNote = note;
  mVel = vel;
  offOn = offOnMsg;
 }
