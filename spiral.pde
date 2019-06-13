float x, y;
float r;
float a =.8;
float b =.1;
float theta;
float thetaVel = .5; // 1 = galaxies
float flag = 0; //detect if not first time
float w, h;

float j = 0;
float k = 0;
float jDelta = 50;
float kDelta = 25;


void setup() {
  size(710, 400, P3D);
  r = height*.45;
  theta = 0;
  background(0);
  w = width/2;
  h = height/2;
  stroke(255);
}

void draw() { 
  // background(0);
  pushMatrix();
  /*
  if ( flag == 0) { 
   translate(width/2, height/2);
   }
   */
  if (j > width || j > height) {
    j = random(width/2);
    k = random(height/2);
  }
  if (x > width || x > height ) {
    translate(j, k);
    j = j+ random(jDelta);
    k = k + random(kDelta);
  }
  x = a*cos(theta)*exp(b*theta)+j;
  y = a*sin(theta)*exp(b*theta)+j;

  ellipseMode(CENTER);
  // noStroke();
  // fill(200);
  noFill();
  ellipse(x, y, 5, 5);
  theta += thetaVel;
  if (x > width || x > height) {
    theta = 0;
    stroke(random(255), random(255), random(255));
    flag = 1;
  }
  popMatrix();
}
void mousePressed() {
  background (0);
}
