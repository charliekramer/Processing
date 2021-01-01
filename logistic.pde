
float a = 3.7;
float nt = .5;
float nt_1  = .5;
float t = 0;

void setup() {
  size(900,900,P3D);
  background(0);
  
}

void draw() {
 
  nt = a*nt_1*(1-nt_1);
  ellipse(nt*width,nt_1*height,3,3);
  nt_1 = nt;
  if (random(0,1) > .99) 
  {
    a = random(3.2,3.8);
    rotateX(PI*random(0,8));
    println("reset");
    stroke(random(255),random(255),random(255));
  }
  t++;
  
  
}
