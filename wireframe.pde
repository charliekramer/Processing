// click mouse = reinitialize matrix
// arrow keys: change speed or set to zero (L/R)

int xN = 10;
int yN = 10;
int t = 0;
float[] x = new float[xN];
float[] y = new float[yN];
float speed = 1;

void setup() {
  size(1024, 720);

  for (int i =0; i < xN; i++) {
    for (int j = 0; j < yN; j++) {
      x[i] = random(-width/2,width/2);
      y[j] = random(-height/2,height/2);
    }
  }
}

void draw() {

  background(125);
  translate(width/2, height/2);

  pushMatrix();
  rotate(t*.01*speed*PI);

  for (int i =0; i < xN; i++) {
    for (int j = 0; j < yN; j++) {
      strokeWeight(random(15));
      stroke(random(255), random(255), random(255));
      //  line(x[j], y[i], x[i], y[j]);
      line(x[i], y[i], x[j], y[j]);
    }
  }
  ellipse(0,0,24,24);
  delay(25);
  t++;
  popMatrix();
}

void mousePressed () {
  for (int i =0; i < xN; i++) {
    for (int j = 0; j < yN; j++) {
      x[i] = random(-height/2,height/2);
      y[j] = random(-height/2,height/2);
    }
  }
}

void keyPressed() {
  if (keyCode == UP) speed = speed+.1;
  if (keyCode == DOWN) speed = speed - .1;
  //if (speed < 3 ) speed = 3;
  if (keyCode == LEFT || keyCode == RIGHT) speed = 0;
  
  
}
