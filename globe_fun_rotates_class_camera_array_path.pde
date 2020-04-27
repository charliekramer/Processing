int n = 10;
Globe[] globe = new Globe[n];

float radius = 125/n;
float speed = .0001;
float x = 250;
float y = 300;
float z = 0;
float colorOffset = 1;
float t = 0;
//float i = 0;
float j = 0;
float x0 = width/2;
float y0 = height/2;
float z0 = (height/2.0) / (tan(PI*30.0 / 180.0));
float eyeX, eyeY, eyeZ;
boolean redraw;

void setup() {
  
  size(1480,900, P3D);
  //fullScreen();
  background(0);
  lights();
  
for (int i = 0; i < n; i++) {
  globe[i] = new Globe(radius*(1+i*random(.5,2)), speed*(1+i*random(.5,1)), x*(1+i*random(.5,2)), y*(1+i*random(.5,2)), z*(1+i*random(2,4)), colorOffset*(1+i*random(.5,2)));

}

redraw = true;

//globe[0] = new Globe(radius, speed, x, y, z, colorOffset);
//globe[1] = new Globe(radius*random(.5,2), speed*random(.5,1), x*random(.5,2), y*random(.5,2), z*random(.5,2), colorOffset*random(.5,2));
//globe[2] = new Globe(radius*random(.5,2), speed*random(1,4), x*random(.5,2), y*random(.5,2), z*random(.5,2), colorOffset*random(.5,2));
//globe[3] = new Globe(radius*random(.5,2), speed*random(4,10), x*random(.5,2), y*random(.5,2), z*random(.5,2), colorOffset*random(.5,2));

}




void draw() {
  
  if (redraw) background(0);
  //translate(x0,y0,z0);
  eyeX = (1+sin(t)/2.)*x0;
  //eyeY = (1+cos(t)/2.)*y0;
  //eyeX = (1+tan(t)/2.)*z0;
  
  //camera(eyeX, eyeY, eyeZ, width/2.0, height/2.0, 0, 0, 1, 0);
  camera(mouseX*(1+sin(t)*.5), mouseY*(1+sin(t)*.5), (1+tan(t*.1)*.25)*(mouseY+mouseY)/2, width/2.0, height/2.0, 0, 0, 1, 0);
  
  for (int i = 0; i < n; i++) {
    globe[i].display();
  }

 t += .01;
 
 if(mousePressed) {
   x = mouseX;
   y = mouseY;
   globe[0].x(x);
   globe[0].y(y);
   for (int i = 1; i < n; i++) {
     globe[i].x(x*random(.5,2));
     globe[i].y(y*random(.5,2));
   }
 }
  
  if (keyPressed) {
    if (redraw) redraw = false;
    else redraw = true;
    delay(20);
  }
 
   /*if (j > 280) {
       j = 0;
     x   = random(width);
      y = random(height);
      z = random(-800,0);
     grow_globe(j, x, y, z);
   }
   */
 
 

   //z = (1+sin(2*PI*i))*z0;
}

class Globe {
  float radius;
  float speed;
  float xpos;
  float ypos;
  float zpos;
  float colorOffset;
  float i = 0;
  
  Globe(float _radius, float _speed, float _xpos, float _ypos, float _zpos, float _colorOffset) {
    radius = _radius;
    speed = _speed;
    xpos = _xpos;
    ypos = _ypos;
    zpos = _zpos;
    colorOffset = _colorOffset;
  }
    
    void display() {
      pushMatrix();
      translate(xpos, ypos, zpos);
      rotateY(PI*i);
       noFill();
      stroke((1+sin(j*colorOffset))*125, (1+cos(j/2*colorOffset))*125, (1+tan(j/3*colorOffset)*125));
      sphere(radius);
      popMatrix(); 
     
      i += speed;
      j += .001;
    }
    
    void x(float _x) {
      xpos = _x;
    }
    void y(float _y) {
      ypos = _y;
    }
    
    void z(float _z) {
      zpos = _z;
    }
}
