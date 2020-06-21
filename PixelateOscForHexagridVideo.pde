/**
 * Pixelate  
 * by Hernando Barragan.  
 * 
 * Load a QuickTime file and display the video signal 
 * using rectangles as pixels by reading the values stored 
 * in the current video frame pixels array. 
 */

import processing.video.*;
import oscP5.*;
import netP5.*;
float avgBrightness;
float[] avgBright;
int brightBoxes = 4;


OscP5 oscP5;
NetAddress dest;

int numPixelsWide, numPixelsHigh;
int blockSize = 2;
Movie mov;
color movColors[];

void setup() {
  //size(640, 360);
  //size(1920, 1080);
  avgBright = new float[brightBoxes];

  size(640, 360);
  
  oscP5 = new OscP5(this,9000);
  dest = new NetAddress("127.0.0.1",6448);

  
  //myRemoteLocation = new NetAddress("127.0.0.1",12000);
 
  noStroke();
  //mov = new Movie(this, "transit.mov");
  //mov = new Movie(this, "hexagonJG short.mp4");
  mov = new Movie(this, "hexagonJGshort480.mov");
 
  mov.loop();
  numPixelsWide = width / blockSize;
  numPixelsHigh = height / blockSize;
  movColors = new color[numPixelsWide * numPixelsHigh];
}

// Display values from movie
void draw() {
  if (mov.available() == true) {
    mov.read();
    mov.loadPixels();
    int count = 0;
    for (int j = 0; j < numPixelsHigh; j++) {
      for (int i = 0; i < numPixelsWide; i++) {
        movColors[count] = mov.get(i*blockSize, j*blockSize);
        count++;
      }
    }
  }
  avgBrightness = 0;
  for (int i = 0; i < brightBoxes; i++) {
    avgBright[i] = 0;
  }
  background(255);
  for (int j = 0; j < numPixelsHigh; j++) {
    for (int i = 0; i < numPixelsWide; i++) {
      fill(movColors[j*numPixelsWide + i]);
      avgBrightness += brightness(movColors[j*numPixelsWide+i])/(numPixelsHigh*numPixelsWide);
      if (j < (numPixelsHigh / 2) && i < (numPixelsWide / 2)) avgBright[0] += brightness(movColors[j*numPixelsWide+i])/(numPixelsHigh*numPixelsWide)*16;
      if (j < (numPixelsHigh / 2) && i > (numPixelsWide / 2)) avgBright[1] += brightness(movColors[j*numPixelsWide+i])/(numPixelsHigh*numPixelsWide)*16;
      if (j > (numPixelsHigh / 2) && i < (numPixelsWide / 2)) avgBright[2] += brightness(movColors[j*numPixelsWide+i])/(numPixelsHigh*numPixelsWide)*16;
      if (j > (numPixelsHigh / 2) && i > (numPixelsWide / 2)) avgBright[3] += brightness(movColors[j*numPixelsWide+i])/(numPixelsHigh*numPixelsWide)*16;
      
      rect(i*blockSize, j*blockSize, blockSize, blockSize);
    }
  }
 //println(avgBrightness);
 sendOsc();

}

void sendOsc() {
 
   OscMessage msg = new OscMessage("/hexagrid/avBright");
      msg.add(avgBright[0]);
      msg.add(avgBright[1]);
      msg.add(avgBright[2]);
      msg.add(avgBright[0]);
  oscP5.send(msg, dest);
}
