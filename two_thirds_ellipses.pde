int n = 5;

float[] dRadius = new float[n];
float[] radius = new float[n];


void setup() {
  size(700,350,P3D);
  background(0);

  dRadius[0] = .25;  
  for (int i = 1; i < n; i++) {
  dRadius[i] = dRadius[i-1]*2/3;
  }
  
}



void draw() {

fill(0,3);
strokeWeight(0);
rect(0,0,width,height);

stroke(0,0,255);
for (int i = 0; i < n; i++) {
  radius[i] += dRadius[i];
  strokeWeight(1*(1+sin(frameCount/20))+1);
  if (radius[i] > max(width,height)) radius[i] = 0;
  ellipse(width/2,height/2, radius[i], radius[i]);
}

}

  
  
  
