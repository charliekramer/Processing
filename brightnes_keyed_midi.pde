/**
 * Brightness
 * by Daniel Shiffman. 
 * 
 * This program adjusts the brightness of a part of the image by
 * calculating the distance of each pixel to the mouse.
 */

PImage img;
float radius = -1;
float dRadius = 16;
float maxRadius = 75;
float maxRadiusMax = 400; // largest max radius
float maxdist;

float locX = 0;
float locY = 0;
int trigger = 0;

import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; 
MidiBus myBus; 
int midiDevice  = 0;
float a, b;
float select;

void setup() {
  //size(640, 360);
  //size(1080,1080,P3D); // hexagon
  frameRate(30);
  //size(800,600,P3D); // hexagrid 3D CK BW
  //img = loadImage("JG_Hexagrid_3D_CK_BW.jpeg");
  
  size(800,693,P3D); // hexagrid 3D GW BW 
  img = loadImage("JG_Hexagrid_3D_GW_BW.jpeg");
  
  //img = loadImage("hexagon.jpg");
  
  img.loadPixels();
  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
  loadPixels();
  locX = width/2;
  locY = height/2;
  MidiBus.list(); 
  myBus = new MidiBus(this, midiDevice, 1); 
  

}

void draw() {
  if (trigger == 1  && radius < 0) {
    radius = 1;
    dRadius *= -1;
    trigger = 0;
    locX = random(0,width);
    locY = random(0, height);
    maxRadius = random(20,maxRadiusMax);
    a = random(.2,.5);
    b = random(.2,.5);
    select = random(0,1);
    
  }
  if (radius > 0) {
    locX += random(-2,4);
    locY += random(-4,2);
    if (locX > width) locX = 0;
    if (locX < 0) locX = width;
    if (locY > height) locY = 0;
    if (locY < 0) locY = height;
    
    for (int x = 0; x < img.width; x++) {
      for (int y = 0; y < img.height; y++ ) {
        // Calculate the 1D location from a 2D grid
        int loc = x + y*img.width;
        // Get the R,G,B values from image
        float r,g,b;
        r = red (img.pixels[loc]);
        g = green (img.pixels[loc]);
        b = blue (img.pixels[loc]);
        // Calculate an amount to change brightness based on proximity to the mouse
        if (select < .25)  maxdist = (radius*noise(x,y));//dist(0,0,width,height);
        if (select > .25 && select < .5)  maxdist = (radius*(.5+.2*noise(x,y)));//dist(0,0,width,height);
        if (select > .5 && select < .75)  maxdist = (radius*((random(0,1)+random(0,1)*random(0,1))));//dist(0,0,width,height);
        if (select > .75)  maxdist = (radius*((a+b*random(0,1))));//dist(0,0,width,height);
        
        float d = dist(x, y, locX, locY);
        float adjustbrightness = 255*(maxdist-d)/maxdist;
        r += adjustbrightness;
        g += adjustbrightness;
        b += adjustbrightness;
        // Constrain RGB to make sure they are within 0-255 color range
        r = constrain(r, 0, 255);
        g = constrain(g, 0, 255);
        b = constrain(b, 0, 255);
        // Make a new color and set pixel in the window
        color c = color(r, g, b);
        //color c = color(r);
        pixels[y*width + x] = c;
      }
    }
    updatePixels();
    radius += dRadius;
    
    }
    if (radius > maxRadius) {
      dRadius = -dRadius;
    }
 }
 
 void midiMessage(MidiMessage message, long timestamp, String bus_name) { 
  int note = (int)(message.getMessage()[1] & 0xFF) ;
  int vel = (int)(message.getMessage()[2] & 0xFF);

  println("Bus " + bus_name + ": Note "+ note + ", vel " + vel);
  if (vel > 0 ) {
   trigger = 1;
   println("trigger on");
  }
}
