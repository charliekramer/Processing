int rows;
int cols;
float [][] current;
float [][] previous;
float t = 1; // use to drive sin, etc
float dt = .01; // for color rotation
float dampening = .9999999999999; //999999999999999999;
float randCutoff= .999999; // 1- this = prob of random drop


void setup() {
  size(600, 450);
  //fullScreen();
  colorMode(HSB);
  cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];
}

void mouseDragged() {
  previous[max(min(mouseX,width-1),1)][max(min(mouseY, height-1),1)] = 500;
}

void draw() {
  background(0);
  
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
      if(random(1) > randCutoff) {
        current[i][j] = 500;
        current[i+1][j] = 500;
        current [i-1][j] = 500;
        current[i][j+1] = 500;
        current[i][j-1] = 500;
        current[i+1][j-1] = 500;
        current[i-1][j-1] = 500;
        current[i+1][j+1] = 500;
        current[i-1][j-1] = 500;
      }
        
      int index = i + j*cols;
      pixels[index] = color( abs( cos(t) )*current[i][j], abs( sin(t) )*current[i][j], abs( tan(t) )*current[i][j] );
      }
    }
    updatePixels();
    
    float[][] temp = previous;
    previous = current;
    current = temp;
    
    t = t + dt;
    
    if(mousePressed) previous[max(min(mouseX, width-1),1)][max(min(mouseY, height-1),1)] = 500;
    
  }
    
