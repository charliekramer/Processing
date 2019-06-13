Mover[] movers = new Mover[200];
float t = 0;

void setup() {
  size(800,800);
  smooth();
  background(255);
  for (int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw() {
  t = t+.01;
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
  }
}

class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover() {
    
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,0);
    topspeed = 4;
  }
  
  void update() {
    
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    //dir.mult(0.5*(2+sin(t)*10));
    dir.mult(0.5);
    if(mousePressed) {
      dir.mult(-1);
    }
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display() {
    
    stroke(0);
    fill(175);
     if (mousePressed) 
      fill(random(255), random(255), random(255));
    ellipse(location.x, location.y, 16,16);
  }
  
  void checkEdges() {
    
    if( location.x > width) {
      location.x = 0;
    }
    else if (location.x < 0) {
      location.x = width;
    }
    
    if( location.y > height) {
      location.y = 0;
    }
    else if (location.y < 0) {
      location.y = height;
    }
  }
}
