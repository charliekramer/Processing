PVector loc1;
PVector loc2;
PVector vel1;
PVector vel2;
int boxSize = 300;
int radius1 = 30;
int radius2 = 15;

void setup() {
  size(900,650, P3D);
  loc1 = new PVector(100,100,100);
  vel1 = new PVector(2.5,5,1);
  loc2 = new PVector(100,100,100);
  vel2 = new PVector(5,3,-1);
}

void draw() {
  background(255);
  //fill(255,9);
  //rect(0,0, width, height);
  translate(width/2, height/2);
  rotateY(.5*frameCount/1000);
  rotateX(.3*frameCount/1000);
  rotateZ(.1*frameCount/1000);
  stroke(0);
  strokeWeight(1);
  noFill();
  box(boxSize);
  loc1.add(vel1);
  loc2.add(vel2);
  if(loc1.x > boxSize/2-radius1 || loc1.x < -boxSize/2+radius1) vel1.x *= -1;
  if(loc1.y > boxSize/2-radius1 || loc1.y < -boxSize/2+radius1) vel1.y *= -1;
  if(loc1.z > boxSize/2-radius1 || loc1.z < -boxSize/2+radius1) vel1.z *= -1;
 
  if(loc2.x > boxSize/2-radius2 || loc2.x < -boxSize/2+radius2) vel2.x *= -1;
  if(loc2.y > boxSize/2-radius2 || loc2.y < -boxSize/2+radius2) vel2.y *= -1;
  if(loc2.z > boxSize/2-radius2 || loc2.z < -boxSize/2+radius2) vel2.z *= -1;
  
  pushMatrix();
  translate(loc1.x, loc1.y, loc1.z);
  fill(255);
  stroke(0);
  strokeWeight(.1);
  sphere(radius1);
  popMatrix();
  
   pushMatrix();
  translate(loc2.x, loc2.y, loc2.z);
  fill(255);
  stroke(0);
  strokeWeight(.1);
  sphere(radius2);
  popMatrix();
  
  vel1.mult(.999);
  vel2.mult(.999);
  
  if (mousePressed) {
    /*
    vel1.x = 2.5;
    vel1.y = 5;
    vel1.z = 1;
    vel2.x = 5;
    vel2.y = 3;
    vel2.z =-1;
    */
    vel1.x = random(-5,5); 
    vel1.y = random(-5,5);  
    vel1.z = random(-5,5);
    
    vel2.x = random(-5,5); 
    vel2.y = random(-5,5);  
    vel2.z = random(-5,5);
  
  }
  
}
