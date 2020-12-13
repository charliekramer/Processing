int cols, rows;

void setup() {

size(900,900);
cols = width;
rows = height;

}

void draw() {

background(0);

for (int i = -100; i < cols+100; i ++) {
  for (int j = -100; j < rows+100; j++) {
    if (i  % 100 == 0) ellipse(j+100*sin(frameCount/10.), i+20.*sin(j/10.),2,2);
    if (i  % 150 == 0) ellipse(j+100*cos(frameCount/10.), i+20.*sin(j/10.),2,2);

  }
}

}
