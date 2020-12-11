void setup() {
 
  size(900,450, P3D);
  
}

void draw() {
  fill(0,3);
  rect(0,0,width,height);
  translate(width/2, height/2, 0); 
  rotateY(0.5*(1+cos(frameCount/40.)));
  rotateX(0.5*(1+cos(frameCount/45.)));
  noFill();
  stroke(255);
   box(18.25*(1+sin(frameCount/100.)));
  box(37.5*(1+sin(frameCount/100.)));
  box(75*(1+sin(frameCount/100.)));
  
  box(150*(1+sin(frameCount/100.)));
 
} 
