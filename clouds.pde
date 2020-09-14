import processing.sound.*;

SinOsc sin;
Reverb reverb;
Delay delay;

void setup() {
  //size(950,500);
  fullScreen();
  sin = new SinOsc(this);
  
  reverb = new Reverb(this);
  reverb.room(0.5);
  reverb.damp(.5);
  reverb.wet(0.5);
  reverb.process(sin); 
   
  delay = new Delay(this);
  delay.process(sin, 5.0);
  delay.feedback(.7);
  delay.time(1.5);
  
  sin.play();
}

int n;
int nMax = 10;
float xCenter = width/2;
float yCenter = height/2;
float randMaxMax = 45;
float randMax = randMaxMax*.5;
float cutoffMax = 1;
float cutoff = 0.9;


void draw() {
  
 
  
  fill(0,6);
  rect(0,0,width,height);
  
  n = int(random(nMax));
  
  for (int i = 0; i < n; i ++) {
    fill(255);
    noStroke();
    ellipse(xCenter+random(-randMax,randMax), yCenter+random(-randMax,randMax), random(randMax), random(randMax));
  }
  
  if (random(0,1) > cutoff) {
    xCenter = random(width);
    yCenter = random(height); 
    
  }
  
  float frequency = map(yCenter, 0, height, 600, 20);
  sin.freq(frequency);
  float panning = map(xCenter, 0, width, -1.0, 1.0);
  sin.pan(panning);
  sin.amp(0.1);
  
   if (mousePressed) {
    cutoff = float(mouseX)/float(width)*cutoffMax;
    randMax = float(mouseY)/float(height)*randMaxMax;
  }
  
  delay(int(random(125,750)));
  
 
  
}
