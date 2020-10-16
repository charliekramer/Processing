void setup() {
  
size(900,450, P3D);
  
}

void draw() {
  fill(250,9);
  rect(0,0,width, height);
  translate (width/2, height/2, 0);
  rotateX(PI/1.33*frameCount/100*sin(frameCount/100));
  rotateZ(PI/1.66*frameCount/100*cos(frameCount/100));
  rotateY(PI/1.11*frameCount/100*tan(frameCount/100));
  
  float speed = 1000;
  float a = .2*(2*(1+sin(frameCount/speed)) + 1*(1+cos(frameCount/speed)));
  
  stroke(0);
  beginShape();
vertex(-100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)));
vertex( 100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)));
vertex(   0,    0,  100*(1+sin(a*frameCount)));

vertex( 100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)));
vertex( 100*(1+sin(a*frameCount)),  100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)));
vertex(   0,    0,  100*(1+sin(a*frameCount)));

vertex( 100*(1+sin(a*frameCount)), 100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)));
vertex(-100*(1+sin(a*frameCount)), 100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)));
vertex(   0,   0,  100*(1+sin(a*frameCount)));

vertex(-100*(1+sin(a*frameCount)),  100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)));
vertex(-100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)), -100*(1+sin(a*frameCount)));
vertex(   0,    0,  100*(1+sin(a*frameCount)));
endShape();
  
}
