int n = 3;
Clock[] clock = new Clock[n*n];

float x = width/2;
float y = height/2;
float radius = 4*height/n;
float t = 0;
float speed = 0.01;

void setup () {
  background (0);
  stroke(255);
  strokeWeight(2);
  size(1200, 750, P3D);
   int k = 0;
   for (int i = 0; i < n; i++) {
     for (int j = 0; j < n; j++) {
      clock[k] = new Clock(.5*width/n*(1+2*i),.5*height/n*(1+2*j) , radius*random(.5,1), speed*random(.5,1));
      k++;
    }
   }
  
}



void draw() {
  //translate(x, y, 0);
  fill (0);
  
  ellipse(width/2, height/2, 2*radius, 2*radius);
  line(width/2, height/2, width/2+radius*cos(t), height/2+radius*sin(t));
  //pushMatrix();
  t += speed*PI;
   int k = 0;
   for (int i = 0; i < n; i++) {
     for (int j = 0; j < n; j++) {
      clock[k].display();
      k++;
    }
   }
 
}

class Clock {
  float radius;
  float speed;
  float xpos;
  float ypos;
  float tick;
  
  Clock(float _xpos, float _ypos, float _radius, float _speed) {
    radius = _radius;
    speed = _speed;
    float tick = 0;
     fill (0);
     
     xpos = _xpos;
     ypos = _ypos;
  
     ellipse(xpos, ypos, 2*radius, 2*radius);
  }
    
    void display () {
    fill(0);
    
    ellipse(xpos, ypos, 2*radius, 2*radius);
    line(xpos, ypos, xpos+radius*cos(tick), ypos+radius*sin(tick));
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
