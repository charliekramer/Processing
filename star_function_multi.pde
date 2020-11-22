int n = 3;
//PShape s[] = new PShape[n];
PShape s;
float[] x = new float[n];
float[] y = new float[n];
float[] size = new float[n];
float[] speed = new float[n];
float[] wide = new float[n];
float[] red = new float[n];
float[] green = new float[n];
float[] blue = new float[n];


void setup() {
  size(1200,900);
  for (int i = 0; i < n; i++) {
    
    wide[i] = random(1);
    x[i] = random(width*wide[i]);
    y[i] = random(height*wide[i]);
    size[i] = random(200);
    speed[i] = random(.05);
    red[i] = random(255);
    green[i] = random(255);
    blue[i] = random(255);
  }
    
}

void draw() {
 fill(0,9);
 noStroke();
 rect(0,0,width,height);
  
  for (int i = 0; i < n; i++) {
  
    star(x[i],y[i],size[i],wide[i], speed[i],red[i],green[i],blue[i]);
    if (random(1) > .99) {
    
      wide[i] = random(1);
      x[i] = random(width*wide[i]);
      y[i] = random(height*wide[i]);
      size[i] = random(200);
      speed[i] = random(.05);
      red[i] = random(255);
      green[i] = random(255);
      blue[i] = random(255);
  
      
  }
  
}
}

void star(float xPos, float yPos, float starSize, float wide, float speed, float red, float green, float blue) {
 translate(xPos, yPos);
  s =createShape();
  float z = (1+sin(frameCount*speed));
  noFill();
  stroke(red,green,blue);
  s.beginShape();
  for(int i = 1; i < width*wide; i++) {
    s.vertex(i*z,z*starSize/i);
  }
   for(int i = 1; i < width*wide; i++) {
    s.vertex(i*z,-z*starSize/i);
  }
   for(int i = 1; i < width*wide; i++) {
    s.vertex(-i*z,z*starSize/i);
  }
   for(int i = 1; i < width*wide; i++) {
    s.vertex(-i*z,-z*starSize/i);
  }
  s.endShape(CLOSE);
   
  shape(s,0,0);
}
