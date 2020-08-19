float z = 0;
float dz = .2;
void setup() {
  
 size(900,450, P3D);
 background(0);
 
}

void draw() {
  
  //fill(0,9);
  //rect(0,0,width,height);
  if(!mousePressed) background(0);
  translate(width/2, height/2);
  
  float size = 10*(2+.2*sin(frameCount*.1));
  
  rotateX(PI/4*frameCount/50);
  rotateY(PI/8*frameCount/10);
  //rotateZ(PI/16*frameCount/1);
  noStroke();
  
  for (float x = -width+size/2; x < 2*width - size; x = x + size) {
    for (float y = -height+size/2; y < 2*height - size; y = y + size) {
      fill(x/width*255,y/height*255,z*255);
      ellipse(x,y,size*noise(x,y,z), size*noise(x,y,z));
    }
  }
  
  z += dz;
  //delay(10);
}
    
