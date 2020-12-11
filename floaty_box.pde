
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
  
  translate(width/2,height/2);
  
  float speed = 1*(height/(mouseY+1));
  
  float a = 100*(1+sin(frameCount/100.*speed));
  float b = 100*(1+sin(frameCount/150.*speed));
  float c = 100*(1+sin(frameCount/300.*speed));
  float d = 100*(1+sin(frameCount/250.*speed));
  //c = a;
  d = a;
  
  beginShape();
  vertex(0,0,0);
  vertex(a,0,0);
  vertex(b,0,-c);
  vertex(d,0,0);
  vertex(a,b,0);
  vertex(0,c,0);
  vertex(0,0,0);

  vertex(0,0,-d);
  vertex(a,0,-b);
  vertex(c,d,-a);
  vertex(0,b,-c);
  vertex(0,0,-d);

  vertex(0,0,0);
  vertex(0,a,0);
  
  
  vertex(0,b,-c);
  vertex(d,a,-b);
  
  vertex(c,d,0);
  
  
  
  endShape();
 
  
}
