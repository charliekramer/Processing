void setup() {
  size(300,300);
}

int t = 0;
int s = 0;
int ds = 3;
int dt = 2;

void draw() {
  
  drawCircle(width/2+t, height/2+s, 20*(1+sin(t/100)));
  s += ds;
  t += dt;
  
  if (width/2+t > width || width/2+t < 0) dt *= -1;
  
  if (height/2+s > height || height/2+s < 0) ds *= -1;
  
}


void drawCircle(int x, int y, float radius) {
  ellipse(x, y, radius, radius);
  if(radius > 2) {
    radius *= 0.75f;
    drawCircle(x, y, radius);
  }
}
