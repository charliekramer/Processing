void setup() {
  size(900,450);
}

float j =0;
float dj = 1;
float xrate = 0.05*.5;
float yrate =0.05*2*.5;
int colors = 1;
int nEllipse = 3;

void draw() {
  //background(0);
  fill(0,9*(1+sin(frameCount)));
  rect(0, 0, width, height);
  noFill();
  stroke(255);
 for (int i = 0; i < width; i = i+(width/nEllipse)) {
   if (colors == 1) stroke(255,0,0);
   ellipse(width/2,height/2, (j-i) % width,(j-i) % width);
   if (colors == 1) stroke(0,255,0);
   ellipse(width/2,height/2, (j-i) % width,((j-i) % width)*(1+sin(j*yrate)));
   if (colors == 1) stroke(0,0,255);
   ellipse(width/2,height/2, ((j-i) % width) * (1+sin(j*xrate)),((j-i) % width));
   if (colors == 1) stroke(255,255,0);
   ellipse( width/2,height/2, ((j-i) % width) * (1+sin(j*xrate)), ((j-i) % width)*(1+sin(j*yrate)));
  if (colors == 1) stroke(255,0,255);
   ellipse( width/2,height/2, ((j-i) % width) * (1+sin(j*xrate)), ((j-i) % width)*(1+cos(j*yrate)));
 }
 
 j += dj;
 dj = 2*sin(frameCount/100);
 
}
