
void setup() {
  
  size(1200,700);
  
}


float t = 0;
float dt = .1;

void draw() {
  fill(255,9);
  rect(0,0,width,height);
  
  int n = int(random(0,50));
  float x = random(width);
  float y = random(height);
  for (int i = 0; i < n; i++) {
    float radius = random(100);
    ellipse(x+random(width/10)*abs(sin(t)), y+random(height/10)*abs(sin(t)),radius, radius);
  }
  
  delay(int(random(1000)));
  t += dt;
  
}
