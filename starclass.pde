//receives data from starclass.ck
// need to fix scaling (in setting ellipse)
// minR, maxR, basefreq drive everything?
// 3D version

// chuck paramters
float gainSet = .1;
int nStar = 15; // check same as in ChucK
float baseFreq = 220; // I think this is midiBase freq / 2, scaling?
float rMax = .5;

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress dest;


float gains[];
float pans[];
float freqs[];


void setup() {
  fullScreen();
   //size(900, 450, P3D);
    oscP5 = new OscP5(this,6449);
    dest = new NetAddress("127.0.0.1",9000);
    
    gains = new float[nStar];
    pans = new float[nStar];
    freqs = new float[nStar];

 
}

void draw() {
  fill(0,7);
  rect(0,0,width,height);
  translate(width/2, height/2);
 
  
  for (int i = 0; i < nStar; i++) 
  {
    noStroke();
    fill(255*gains[i]/gainSet);
    ellipse(pans[i]*width/(2*rMax), (baseFreq-freqs[i])/baseFreq*height/(2*rMax), gains[i]*height/(25*gainSet), gains[i]*height/(25*gainSet));
  }
  
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
  if(theOscMessage.checkAddrPattern("/star/gains")==true) {
    for (int i = 0; i < nStar; i++) {
      gains[i] = theOscMessage.get(i).floatValue();
    }
  }
  if(theOscMessage.checkAddrPattern("/star/pans")==true) {
    for (int i = 0; i < nStar; i++) {
      pans[i] = theOscMessage.get(i).floatValue();
    }
  }
  if(theOscMessage.checkAddrPattern("/star/freqs")==true) {
    for (int i = 0; i < nStar; i++) {
      freqs[i] = theOscMessage.get(i).floatValue();
    }
  }


}
