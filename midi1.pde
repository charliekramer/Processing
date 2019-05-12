// SimpleMidi.pde

import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; 

MidiBus myBus; 

int currentColor1 = 0;
int currentColor2 = 0;
int currentColor3 = 0;
int midiDevice  = 2;

void setup() {
  size(480, 320);
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1); 
}

void draw() {
  background(currentColor1,currentColor2,currentColor3);
}

void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int note = (int)(message.getMessage()[1] & 0xFF) ;
  int vel = (int)(message.getMessage()[2] & 0xFF);

  println("Bus " + bus_name + ": Note "+ note + ", vel " + vel);
  if (vel > 0 ) {
   currentColor1 = vel*2;
   currentColor2 = note*4;
   currentColor3 = note*6;
  }
}
