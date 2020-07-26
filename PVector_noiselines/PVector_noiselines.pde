// wandering lines in PVector
// make class to generate random number of wanderin lines
// translucent background
//lower and upper limits on distributon of changes of each point
// todo-connect to chuck/sound generator

float dx1l = random(-5);
float dx1u = random(5);
float dy1l = random(-5);
float dy1u = random(5);
float dx2l = random(-5);
float dx2u = random(5);
float dy2l = random(-5);
float dy2u = random(5);

int ellipses = 1; // == 1, draw ellipses at ends
float ellipseSize = 10;

float pitch1, pitch2, pan1, pan2, vol; // pitch and vol scaled to (0,1), pan to (-1,1)

float cutoff = .999; // cutoff to reset parameters

PVector v1, v2;

void setup() {
  size(950,730);
  v1 = new PVector(random(width), random(height));
  v2 = new PVector(random(width),random(height));
}

void draw() {
  
  fill(125,9);
  rect(0,0, width, height);

  //line(v1.x,v2.x,v1.y,v2.y);
  line(v1.x,v1.y,v2.x,v2.y);
  
  if (ellipses == 1) {
    ellipse(v1.x,v1.y, ellipseSize, ellipseSize);
    ellipse(v2.x,v2.y, ellipseSize, ellipseSize);
  }
  v1.add(random(dx1l,dx1u),random(dy1l,dy1u));
  v2.add(random(dx2l,dx2u),random(dy2l,dy2u));
  if (v1.x < 0) v1.x = width;
  if (v1.y < 0) v1.y = height;
  if (v1.x > width) v1.x = 0;
  if (v1.y > height) v1.y = 0;
  
  if (v2.x < 0) v2.x = width;
  if (v2.y < 0) v2.y = height;
  if (v2.x > width) v2.x = 0;
  if (v2.y > height) v2.y = 0;
  
  if (random(1) > cutoff) {
    // reset speed parameters
     dx1l = random(-5);
     dx1u = random(5);
     dy1l = random(-5);
     dy1u = random(5);
     dx2l = random(-5);
     dx2u = random(5);
     dy2l = random(-5);
     dy2u = random(5);
  }

  pitch1 = map(v1.y, 0, height, 1, 0);
  pitch2 = map(v2.y, 0, height, 1, 0);
  pan1 = map(v1.x, 0, width, -1, 1); 
  pan2 = map(v2.x, 0, width, -1, 1);
  vol = dist(v1.x,v1.y,v2.x,v2.y)/dist(0,0,width,height);
  println("pitches ", pitch1, pitch2, " pans ", pan1, pan2, " vol ", vol);
  
}
