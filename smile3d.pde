float radius = 100;
float xpos, ypos;

import processing.sound.*;

PinkNoise noise;
LowPass lowPass;
Reverb reverb;

void setup() {
  size(1200,950, P3D);
  noise = new PinkNoise(this);
  noise.play();
  
  lowPass = new LowPass(this);
  lowPass.process(noise);

  reverb = new Reverb(this);
  
  reverb.process(noise);
  
}

void draw() {
  
  float revWet = map(mouseY, 0, height, 0, 1.0);
  reverb.wet(revWet);
  noStroke();
  fill((1+sin(frameCount/20))*125,16);
  rotateY(sin(frameCount)*PI/2);
  rotateY(sin(frameCount)*PI/8);
  rect(0,0,width,height);
  
  xpos = random(width);
  ypos = random(height);
  
  translate(xpos,ypos);
  
  noise.pan(map(ypos, 0, height, -1, 1));
  float cutoff = map(xpos, 0, width, 20, 750);
  lowPass.freq(cutoff);
  
  stroke(255);
   stroke((1+cos(frameCount/20))*125);
 
  noFill();
  
  radius = random(5,125);
  noise.amp(radius/125.);
  
  ellipse(0,0,radius,radius);
  
  ellipse(radius*.25, -radius*.15, radius*.1, radius*.1);// right eye
  ellipse(-radius*.25, -radius*.15, radius*.1, radius*.1); // left eye
  ellipse(0,0,5,5); //nose
  line(-radius*.25, radius*.2, radius*.25, radius*.2);
  
  delay(2500*mouseX/width);
  
}
