PVector origin;
PVector bob;
float len;
float len0;
float angle = PI/4;
float aVel = 0;
float aAcc = 0;

void setup() {
  size(640,360);
  
  len = 300;
  len0 = len;
  origin = new PVector(width/2,0);
  bob = new PVector(width/2,len);
}

void draw() {
  //background(0);
  fill(0,9);
  rect(0,0,width,height);
  
  stroke(255);
  
  bob.x = origin.x + len*sin(angle); 
  bob.y = origin.y + len*cos(angle);
  
  line(origin.x, origin.y, bob.x, bob.y);
  fill(255*abs(sin(frameCount*.01)),125, 255*abs(cos(frameCount*.02)));
  ellipse(bob.x, bob.y, 32, 32);
  
  aAcc = -0.01*sin(angle) ;
  
  angle += aVel;
  aVel += aAcc;
  aVel *=.99;
  delay(50);
  len = len0+ 100*cos(frameCount*.1);
  
  
}
