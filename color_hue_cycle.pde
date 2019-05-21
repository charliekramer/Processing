

int NSize = 200;
float k = 0;
float kdiff = 50;

void setup() {
  
  noStroke();

  size(400, 400);
  colorMode(HSB, NSize);
}

void draw() {
  
  for (int i = 0; i < NSize; i++) {
    for (int j = 0; j < NSize; j++) {
      stroke(i+k, j+k, k);
      point(i+k, j+k);
    }
  }
  k=k+kdiff;
  if (k <= 0 || k >= NSize) {
    kdiff = -1*kdiff;
    kdiff = kdiff+random(-1,1);
  }
  
}
