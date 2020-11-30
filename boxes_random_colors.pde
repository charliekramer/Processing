int rows = 5;
int cols = 8;
float wide;
float high;
float color1, color2, color3;
color[][] c;

void setup() {
  size(900,450);
  high = height/rows;
  wide = width/cols;
  c = new color[cols][rows];
  color1 = random(255);
  color2 = random(255);
  color3 = random(255);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      c[i][j] = color(random(255), random(255), random(255));
    }
  }
  
  
}

void draw() {
  stroke(0);
  strokeWeight(5);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (random(1) > .99)  c[i][j] = color(random(255), random(255), random(255));
      fill(c[i][j]);
      rect(i*wide,j*high,(i+1)*wide,(j+1)*high);
    }
  }
}
