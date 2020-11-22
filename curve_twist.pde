// Move the mouse left and right to see the curve change

int max = 20;
int n = max;
float speed = 0.01;
float[] x = new float[max];
float[] y = new float[max];
void setup() {
  size(900, 600);
  for (int i = 0; i < max; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
  noFill();
}

void draw() {
  fill(0,16);
  rect(0,0,width,height);
  //float t = map(mouseX, 0, width, -5, 5);
  curveTightness(5*sin(frameCount*speed));
  stroke(255);
  beginShape();
  for (int i = 0; i < n; i++) {
     curveVertex(x[i], y[i]);
  }
  endShape();
  
  if(random(1) > .99) {
    n = floor(random(5,max+1));
    speed = random(.005,.02);
    for (int i = 0; i < n; i++) {
    x[i] = random(width);
    y[i] = random(height);
  }
  }
  
}
