
void setup() {
  size(900,500,P3D);
}

void draw() {
  fill(0,32*mouseX/width);
  rect(0,0,width,height);
  
  stroke(255);
 // rotateY(2*PI*(1+sin(frameCount/100.)));
 // rotateX(2*PI*(1+sin(frameCount/200.)));
 //rotateX(.25*PI*mouseX/width);
 //rotateY(.25*PI*mouseY/height);
 // rotateZ(.5);
  
  noFill();
  
  translate(width/4,height/4);
  
  float speed = 1*(height/(mouseY+1));
  
  float boxSize = 200;
  
  float a = boxSize*(1+sin(frameCount/100.*speed));
  float b = boxSize*(1+sin(frameCount/150.*speed));
  float c = boxSize*(1+sin(frameCount/300.*speed));
  float d = boxSize*(1+sin(frameCount/250.*speed));
  float e = boxSize*(1+sin(frameCount/400.*speed));
  float f = boxSize*(1+sin(frameCount/425.*speed));
  float g = boxSize*(1+sin(frameCount/50.*speed));
  float h = boxSize*(1+sin(frameCount/25.*speed));
  float i = boxSize*(1+sin(frameCount/725.*speed));
  float j = boxSize*(1+sin(frameCount/45.*speed));
  float k = boxSize*(1+sin(frameCount/500.*speed));
  float l = boxSize*(1+sin(frameCount/475.*speed));
  float m = boxSize*(1+sin(frameCount/375.*speed));
  float n = boxSize*(1+sin(frameCount/325.*speed));
  float o = boxSize*(1+sin(frameCount/175.*speed));
  float p = boxSize*(1+sin(frameCount/325.*speed));
  float q = boxSize*(1+sin(frameCount/350.*speed));
  float r = boxSize*(1+sin(frameCount/425.*speed));
  float s = boxSize*(1+sin(frameCount/475.*speed));
  float t = boxSize*(1+sin(frameCount/525.*speed));
  float u = boxSize*(1+sin(frameCount/225.*speed));
  float v = boxSize*(1+sin(frameCount/275.*speed));
  float w = boxSize*(1+sin(frameCount/425.*speed));

  
  beginShape();
  vertex(0,0,0);
  vertex(a,0,0);
  vertex(b,0,-c);
  vertex(d,0,0);
  vertex(e,f,0);
  vertex(0,g,0);
  vertex(0,0,0);

  vertex(0,0,-h);
  vertex(a,0,-i);
  vertex(j,k,-l);
  vertex(0,m,-n);
  vertex(0,0,-o);

  vertex(0,0,0);
  vertex(0,p,0);
  
  
  vertex(0,q,-r);
  vertex(s,t,-u);
  
  vertex(v,w,0);
  
  
  
  endShape();
 
  
}
