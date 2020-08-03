// color organ
// mouse press==stop background redraw
// any key--randomize x and y
// now with misc shapes
// use input = loopback audio in mac system preferences to route from ChucK


import processing.sound.*;
import controlP5.*;
ControlP5 cp5;


FFT fft;
AudioIn in;
int bands = 16; //16
float[] spectrum = new float[bands];
//float xRandom = random(512);
//float yRandom = random(360);

float xRandom = random(width);
float yRandom = random(height);

float[] xRand = new float[bands];
float[] yRand = new float[bands];
int j = 0;
float randShape;
int selector = 0; //select shapes
float gainUp = 5; // increase gain

// h, w was 512,360)


void setup() {
  size(1024, 720);
  //fullScreen();
  background(255);
  colorMode(HSB,255); 

  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);

  // start the Audio Input
  in.start();

  // patch the AudioIn
  fft.input(in);

  int i;

  for (i = 0; i < bands; i++) {
    xRand[i] = random(width/bands);
    yRand[i] = random(height/bands);
  }
  
   cp5 = new ControlP5(this);
   
  cp5.addSlider("selector")
     .setPosition(0,0)
     .setSize(10,200)
     .setRange(0,9)
     .setValue(0)
     .setColorCaptionLabel(color(20,20,20));
     
  cp5.addSlider("gainUp")
     .setPosition(width-200,height-10)
     .setSize(200,10)
     .setRange(.1,10)
     .setValue(5)
     .setColorCaptionLabel(color(40,40,40));
   
    
  
   
}      

void draw() { 

  // if (!mousePressed) background(1+(sin(j/10))*127, 0, 1+(cos(j/10))*127);
  if (!mousePressed) background(1+(sin(j/10))*255);

  //selector = 0; // 4 for piece with Jeremy
  
  j++;

  fft.analyze(spectrum);
  
  randShape = random(1);

  for (int i = 0; i < bands; i++) {
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by gainUp to get more amplitude.
    // fill(i*50,50/(i+1),125/(i+1));
    fill((sin(i)+2)*125, (2+cos(i))*125, random(0,255));

    // diagonal array
    if (selector == 0) {
      if (randShape > .5) rect(i*width/bands, i*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
      else ellipse(i*width/bands, i*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
   
  }
    // concentric, random
    if (selector == 1) {
      if (randShape > .5) rect(xRandom, yRandom, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
      else ellipse(xRandom, yRandom, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
 
  }
    // random each time
    if (selector == 2) {
      if (randShape > .5) rect(random(width), random(height), spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
      else ellipse(random(width), random(height), spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
 
  }
    // x random chosen first time // default for data visualization
    if (selector == 3) {
      if (randShape > .5) rect(xRand[i], random(height), spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
      else ellipse(xRand[i], random(height), spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
   
  }

    // both x and y random first time
    //rect(xRand[i], yRand[i], spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );

    // grid  // default for data visualization
    if (selector == 4) {
      for (int k=1; k < height/bands; k ++) {
        randShape = random(1);
        if (randShape < .33) rect(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else if (randShape < .66) ellipse(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else triangle(i*width/bands, k*height/bands, i*width/bands-spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp ,i*width/bands+spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp );  
      }
    }
    
     // grid  // default for data visualization
     if (selector == 5) {// all same shape on each pass
    
      randShape = random(1);
      for (int k=1; k < height/bands; k ++) {   
        if (randShape < .33) rect(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else if (randShape < .66) ellipse(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else triangle(i*width/bands, k*height/bands, i*width/bands-spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp ,i*width/bands+spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp );  
      }
    }
    
     if (selector == 6) { // all rectangles
      randShape = 0;
      for (int k=1; k < height/bands; k ++) {   
        if (randShape < .33) rect(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else if (randShape < .66) ellipse(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else triangle(i*width/bands, k*height/bands, i*width/bands-spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp ,i*width/bands+spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp );  
      }
    }
   
    if (selector == 7) { // all circles
      randShape = .5;
      for (int k=1; k < height/bands; k ++) {   
        if (randShape < .33) rect(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else if (randShape < .66) ellipse(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else triangle(i*width/bands, k*height/bands, i*width/bands-spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp ,i*width/bands+spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp );  
      }
    }
    
    if (selector == 8) { // all triangles
      randShape = .9;
      for (int k=1; k < height/bands; k ++) {   
        if (randShape < .33) rect(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else if (randShape < .66) ellipse(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else triangle(i*width/bands, k*height/bands, i*width/bands-spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp ,i*width/bands+spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp );  
      }
    }
   
      if (selector == 9) { // chosen outside loop
      for (int k=1; k < height/bands; k ++) {   
        if (randShape < .33) rect(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else if (randShape < .66) ellipse(i*width/bands, k*height/bands, spectrum[i]*height*gainUp, spectrum[i]*height*gainUp );
         else triangle(i*width/bands, k*height/bands, i*width/bands-spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp ,i*width/bands+spectrum[i]*height*gainUp, k*height/bands-spectrum[i]*height*gainUp );  
      }
    }
  
    
    //filter(ERODE);
    //filter(THRESHOLD,.3);
    
    delay(5); // was 5

    if (keyPressed) {
      xRand[i] = random(width);
      yRand[i] = random(height);
    }
  }
}
