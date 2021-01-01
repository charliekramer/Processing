float xdiv = 10;
float ydiv =10;
float xpos = width/2;
float ypos = height/2;
float x = xpos;
float y = ypos;
float xdir = 1;
float ydir = 1;
float xon = 1;
int quant = 1; //quantize x y divisions

void setup() {
  size(900,900,P3D);
  background(0);
}

void draw() {
 
  
  if (xon == 1) {
    
    if (xdir  == 1) x = xpos+random(0,width-xpos);
    else x = xpos - random(0,xpos);
    y = ypos;
  }
  else {
    if (ydir  == 1) y = ypos+random(0,height-ypos);
    else y = ypos - random(0,ypos);
    x = xpos;
  }
  
  
  
    //rotateZ(2*PI*frameCount/20);
  ellipse(x,y,3,3);
  if (random(0,1) > .99) 
  {
    
    println("reset");
    stroke(random(255),random(255),random(255));
    xpos = random(0,width);
    ypos = random(0,height);
    if (quant == 1) {
      xpos = int(random(0,xdiv))/xdiv*width;
      ypos = int(random(0,ydiv))/ydiv*height;
    }
    xdir *= -1;
    ydir *= -1;
    xon *= -1;
  }
  
  
 
  
  
}
