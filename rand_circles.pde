int rows;
int cols;
float rad = 25;
float minR = -1;
float maxR = 2;
float minG = -1;
float maxG = 2;
float minB = -1;
float maxB = 2;
int nCircles = 14;
float rads[] = new float[nCircles];

void setup() {
  size(900,900,P3D);
  rows = height;
  cols = width;
  background(0);
  fill(125,125,125);
  rect(0,0,width,height);
  translate(width/2,height/2);
  strokeWeight(10);
  fill(255,0,255);
  ellipse(0,0,2*rad,2*rad);
  for (int k = 0; k < nCircles; k++) {
    rads[k] = rad*(k+1);
  }
  
}

void draw() {

  maxR *= (1+sin(frameCount));
  maxB *= (1+cos(frameCount/2.));
  maxG *= (1+tan(frameCount/3.));
  
  loadPixels();
  
   for (int i = 0; i < cols; i++) {
     for (int j = 0; j < rows; j++) {
       for (int k = 0; k < nCircles; k++) {
         if ( pow((i-width/2.),2) + pow((j-height/2.),2) < pow(rads[k],2)) {
         pixels[i + j*cols] += color(random(minR,maxR), random(minG,maxG), random(minB,maxB));
         }
       }
     }
   }
  
  if (random(0,1) > .9) {
    maxR = random(1,4);
    maxG = random(1,4);
    maxB = random(1,4);
    println("reset");
  }
   
  updatePixels();
  
}
