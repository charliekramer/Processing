// splotch on page
// version 2
//  quadratic vertex
// how to makeeach splotch unfurl separately?

float t = 0; //oscillate random size of splotch;
float dt = .1;

int n = 0;

int nVertex = 20;

void setup () {
  
  size(900,500);
  translate(width/2, height/2);
  
}

void draw() {
  //background(0);
  fill(125,100);
  noStroke();
  rect(0,0, width, height);
  float x = random(0,width);
  float y = random(0,height);
  float x0 = x;
  float y0 = y;
  float x1 = x;
  float y1 = y;
  fill(102);
  stroke(255);
  strokeWeight(2);
  
  float randSize = (1+sin(t))*100;
  
  
  beginShape();
   fill(random(255),random(255),random(255));
   
   noStroke();
   vertex(x0,y0);
  for (int i = 0; i < n % nVertex; i++) {
    
    quadraticVertex(x,y,x1, y1);
    
    x1 = x;
    y1 = y;
    
    x = x +random(-randSize,randSize);
    
    y = y +random(-randSize,randSize);
    //ellipse(x,y,2*i,2*i);
  }
  quadraticVertex(x0,y0, x1, y1);  
  endShape();
  
   beginShape();
   noStroke();
   vertex(x0,y0);
   fill(random(255),random(255),random(255));
   
  for (int i = n % nVertex; i >  0; i--) {
    quadraticVertex(x, y, x1, y1);
    x1 = x;
    y1 = y;
    x = x +random(-randSize,randSize);
    y = y +random(-randSize,randSize);
   noStroke(); 
   //ellipse(x,y,2*i,2*i);
  }
  
  curveVertex(x0,y0);
    
  endShape();
  
  delay(100);
  
  t += dt;
  n ++;
}
