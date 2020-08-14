void setup() {
  
  size(1200,700);
  
}


float t = 0;
float dt = .1;

float s = 0;
float ds = .1;

void draw() {
  fill(255,9);
  rect(0,0,width,height);
  
  int n = int(random(0,50));
  float x = random(width);
  float y = random(height);
  for (int i = 0; i < n; i++) {
    float radius = random(100);
    float tx = x+random(width/10)*abs(sin(t));
     float ty = y+random(height/10)*abs(sin(t));
    /* 
    if (sin(s) < -.33) 
    {
      ellipse(tx,ty,radius, radius);
    }
    else if (sin(s) > .33) 
    {
      rect(tx,ty,tx+radius,ty+ radius);
    }
    else
    {
      triangle(tx,ty, tx+radius, ty+radius, tx-radius, ty+radius);
    }
   */
   /*
    if (noise(tx,ty) <  .33) 
    {
      ellipse(tx,ty,radius, radius);
    }
    else if (noise(tx,ty) < .66) 
    {
      rect(tx,ty,tx+radius,ty+ radius);
    }
    else
    {
      triangle(tx,ty, tx+radius, ty+radius, tx-radius, ty+radius);
    }
    */
    if (noise(x,y) <  .3) 
    {
      ellipse(tx,ty,radius, radius);
    }
    else if (noise(x,y) < .6) 
    {
      rect(x,y,tx+radius,ty+ radius);
    }
    else
    {
      triangle(x,y, tx+radius, ty+radius, tx-radius, ty+radius);
    }
   
    
}
  
  delay(int(random(1000)));
  t += dt;
  s += ds;
  
}
