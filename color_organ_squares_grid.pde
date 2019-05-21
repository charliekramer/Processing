// color organ
// mouse press==stop background redraw
// any key--randomize x and y
// now with squares

import processing.sound.*;

FFT fft;
AudioIn in;
int bands = 16;
float[] spectrum = new float[bands];
float xRandom = random(512);
float yRandom = random(360);
float[] xRand = new float[bands];
float[] yRand = new float[bands];
int j = 0;

// h, w was 512,360)


void setup() {
  size(1024, 720);
  background(255);

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);

  // start the Audio Input
  in.start();

  // patch the AudioIn
  fft.input(in);

  int i;

  for (i = 0; i < bands; i++) {
    xRand[i] = random(width);
    yRand[i] = random(height);
  }
}      

void draw() { 
  
 // if (!mousePressed) background(1+(sin(j/10))*127, 0, 1+(cos(j/10))*127);
 if (!mousePressed) background(1+(sin(j/10))*255);
 
  
  j++;
  
  fft.analyze(spectrum);

  for (int i = 0; i < bands; i++) {
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    // fill(i*50,50/(i+1),125/(i+1));
    fill((sin(i)+2)*125, (2+cos(i))*125, 125);

    // diagonal array
    if (false) {
    rect(i*width/bands, i*height/bands, spectrum[i]*height*5, spectrum[i]*height*5 );
    }
    // concentric, random
    if (false) {
    rect(xRandom, yRandom, spectrum[i]*height*5, spectrum[i]*height*5 );
    }
    // random each time
    if (false) {
    rect(random(width), random(height), spectrum[i]*height*5, spectrum[i]*height*5 );
    }
    // x random chosen first time
    if (false) {
    rect(xRand[i], random(height), spectrum[i]*height*5, spectrum[i]*height*5 );
    }

    // both x and y random first time
    //rect(xRand[i], yRand[i], spectrum[i]*height*5, spectrum[i]*height*5 );

    // grid
    if (true) {
   for (int k=1; k < height/bands;k ++) {
   rect(i*width/bands, k*height/bands, spectrum[i]*height*5, spectrum[i]*height*5 );
    }
    }
   

    delay(5);
    
    if (keyPressed) {
    xRand[i] = random(width);
    yRand[i] = random(height);
  }
    
  }
}
