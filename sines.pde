int cols, rows;

void setup() {

size(500,500);
cols = width;
rows = height;
background(0);

}

void draw() {

fill(0,55);
rect(0,0,width,height);

for (int i = -100; i < rows+100; i ++) {
  for (int j = -100; j < cols+100; j++) {
    stroke(255*sin(frameCount),255*cos(frameCount),255*tan(frameCount));
    if (i  % 100 == 0) ellipse(j+100*sin(frameCount/10.), i+20.*sin(j/10.),3,3);
    stroke(255*cos(frameCount),255*sin(frameCount),255*tan(frameCount)); 
    if (i  % 150 == 0) ellipse(j+100*cos(frameCount/20.), i+20.*sin(j/10.),2,2);
    stroke(255*tan(frameCount),255*sin(frameCount),255*cos(frameCount));
    if (i  % 75 == 0) ellipse(j+100*tan(frameCount/15.), i+20.*sin(j/10.),4,4);   
    }
  }
}
