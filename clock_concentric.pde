int n = 25;
Clock[] clock = new Clock[n];

float x = width/2;
float y = height/2;
float radius[] = new float[n];
float theta[] = new float[n];
color colors[] = new color[n];
float t = 0;
float speed = 0.01;

void setup () {
  background (0);
  stroke(255);
  strokeWeight(2);
  size(1200, 750, P3D);
   for (int i = 0; i < n; i++) {
     radius[i] = height/5*random(1,10);
     theta[i] = random(-5,5);
     colors[i] = color(random(255), random(255), random(255));
      clock[i] = new Clock(width/2,height/2, radius[i], speed*random(-1,1), colors[i]);
   }
  
}



void draw() {
  //translate(x, y, 0);
  //background(0);
  //fill (0);
  noStroke();
  
  fill(0,9);
  rect(0,0,width,height);
  stroke(255);
   line(0,height/2,width,height/2);
  line(width/2,0,width/2,height);
  fill(255);
  stroke(255);
  
  
  //ellipse(width/2, height/2, 2*radius, 2*radius);
  //line(width/2, height/2, width/2+radius*cos(t), height/2+radius*sin(t));
  //pushMatrix();
  t += speed*PI;
   for (int i = 0; i < n; i++) {
     //ellipse(width/2,height/2,radius[i],radius[i]);
     clock[i].rad(radius[i]*sin(t*theta[i]));
      clock[i].display();
   }
 
}

class Clock {
  float radius;
  float speed;
  float xpos;
  float ypos;
  float tick;
  color colors;
  
  Clock(float _xpos, float _ypos, float _radius, float _speed, color _colors) {
    radius = _radius;
    speed = _speed;
    colors = _colors;
    float tick = 0;
     fill (0);
     
     xpos = _xpos;
     ypos = _ypos;
  
     ellipse(xpos, ypos, 2*radius, 2*radius);
  }
    
    void display () {
    fill(0);
    
    //ellipse(xpos, ypos, 2*radius, 2*radius);
    stroke(colors);
    line(xpos, ypos, xpos+radius*cos(tick), ypos+radius*sin(tick));
    ellipse(xpos+radius*cos(tick), ypos+radius*sin(tick), 10, 10);
    //pushMatrix();
  
    tick += speed*PI;
    }
    
    void x(float _x) {
      xpos = _x;
    }
    
    void y(float _y) {
      ypos = _y;
    }
    
    void rad(float _rad) {
      radius = _rad;
    }
    
    void speed(float _speed) {
      speed = _speed;
    }
}
