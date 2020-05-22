int nRow = 8;
int nCol = 10;
int sphereSize = 50;
int t = 0;

void setup() {
  size(1200,900,P3D);
  noStroke();
  colorMode(RGB,1);
  fill(1);
  //frameRate(4);
  
}

void draw() {
  background(0);
  lightSpecular(1, 1, 1);
  directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
  float s = mouseX / float(width);
  specular(.5+sin(t*.01)*.5, .5*cos(t*.01)*.5, 5*tan(t*.01)*.5);
  
  for (int i = 0; i < nCol; i++) {
    for (int j = 0; j < nRow; j++) {
      pushMatrix();
      float xOff = width/nCol*.5 + width/nCol*i+20*sin(t*.001); 
      float yOff = height/nRow*.5 + height/nRow*j+20*cos(t*.001);
      translate(xOff+1*noise(xOff+t,yOff,0)*(1+.5*sin(t)),yOff+1*noise(xOff,yOff+t,0)*1+.5*cos(t),10*noise(xOff,yOff,t)); 
      sphere(sphereSize);
      popMatrix();
      }
  }
  
  rotateY(PI/8*t);
  
  //delay(int(500*(1+sin(t*.01*2*PI)*.5)));
  t++;
}
