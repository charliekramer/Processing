// Move the mouse left and right to see the curve change

int max = 20;
int n = max;
int corners = 0;
float speed = 0.01;
float theta;
float radius;
float[] x = new float[max];
float[] y = new float[max];
void setup() {
  size(900, 600);
  translate(width/2,height/2);
  theta = random(0,2*PI);
  radius = random(.1,height);
  for (int i = 0; i < max; i++) {
    x[i] = radius*sin(i*theta);
    y[i] = radius*cos(i*theta);
    if (corners == 1) {
      if (random(1) > .5) x[i] = -width/2;
      if (random(1) > .25) x[i] = width/2;
      if (random(1) > .5) y[i] = -height/2;
      if (random(1) > .25) y[i] = height/2;
    }
  }
  noFill();
}

void draw() {
  fill(0,9);
  rect(0,0,width,height);
  //float t = map(mouseX, 0, width, -5, 5);
  curveTightness(5*sin(frameCount*speed));  
  translate(width/2,height/2);
  stroke(255);
  beginShape();
  for (int i = 0; i < n; i++) {
     curveVertex(x[i], y[i]);
  }
  endShape();
  
  if(random(1) > .99) {
    n = floor(random(5,max+1));
    speed = random(.005,.02);
    theta = random(0,2*PI);
    radius = random(.1,height);
  
    for (int i = 0; i < n; i++) {
    x[i] = radius*sin(i*theta);
    y[i] = radius*cos(i*theta);      
    if (corners == 1) {
      if (random(1) > .5) x[i] = -width/2;
      if (random(1) > .25) x[i] = width/2;
      if (random(1) > .5) y[i] = -height/2;
      if (random(1) > .25) y[i] = height/2;
    }
  }
  }
  
}
