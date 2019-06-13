int j = 0;
float radius = .01;
float div = 2;

void setup() {
  size(800,400);
  background(255);
}

void draw() {
  fill(0);
  text("Lines",(1+sin(j*radius))*width/div,(1+cos(j*radius))*height/div);
  
  j = j + 10;
  
  delay(150);
  if (j >= width || j >= height) {
    j = 0;
   // radius = radius +.1;
   div = div+1;
    fill(random(255),random(255),random(255));
   // background(255);
  }
}
  
