int nRow = 15;
int nCol = 30;
int sphereSize = 25;
int t = 0;
int rows;
int cols;
float [][] current;
float [][] previous;
float ts = 1; // use to drive sin, etc
float dt = .01; // for color rotation
float dampening = .999; //999999999999999999;




void setup() {
  size(1200,900,P3D);
  noStroke();
  colorMode(RGB,1);
  fill(1);
  //frameRate(4);
  cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];
 
  
}

void draw() {
  background(0);
  lightSpecular(1, 1, 1);
  directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
  float s = mouseX / float(width);
  specular(.5+sin(t*.01)*.5, .5*cos(t*.01)*.5, 5*tan(t*.01)*.5);
  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      current[i][j] = (
        previous[i-1][j] +
        previous[i+1][j] +
        previous[i][j-1] +
        previous[i][j+1]) / 2 - // cool effects at 1, .5
        current[i][j];
        current[i][j] = current[i][j] * dampening;
         int index = i + j*cols;
      pixels[index] = color( current[i][j] );
      }
    }
    updatePixels();
    
    ts = ts + dt;
    
    
    float[][] temp = previous;
    previous = current;
    current = temp;
    
     if(mousePressed) previous[max(min(mouseX, width-1),1)][max(min(mouseY, height-1),1)] = 500;
   
    
     
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
