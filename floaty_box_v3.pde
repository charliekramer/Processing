
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
  
  float speed = 5.*(height/(mouseY+1));
  
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
  float x = boxSize*(sin(frameCount/1025.*speed));
  float y = boxSize*(sin(frameCount/1035.*speed));
  float z = boxSize*(sin(frameCount/1045.*speed));
  

  
  beginShape();
  vertex(x,y,-z);
  vertex(a,x,-y);
  vertex(b,z,-c);
  vertex(d,x,-y);
  vertex(e,f,-z);
  vertex(x,g,-y);
  vertex(z,x,-y);

  vertex(z,x,-h);
  vertex(a,y,-i);
  vertex(j,k,-l);
  vertex(z,m,-n);
  vertex(x,y,-o);

  vertex(z,x,-y);
  vertex(z,p,-x);
  
  
  vertex(y,q,-r);
  vertex(s,t,-u);
  
  vertex(v,w,-z);
  
  
  
  endShape();
 
  
}
