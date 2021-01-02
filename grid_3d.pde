// add mouse controlled camera option
float xdiv = 10;
float ydiv =10;
float xpos = 0;
float ypos = 0;
float zpos = 0;
float x = xpos;
float y = ypos;
float xdir = 1;
float ydir = -1;
float xon = 1;
float r = random(255);
float g = random(255);
float b = random(255);
float alpha = 32;
float angle = PI/8;

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
  //ellipse(x,y,3,3);
  if (ydir == 1) rotateY(angle); //PI/8
  else rotateX(-angle); //-PI/8
  //fill(0);
  fill(r,g,b,alpha);
  translate(x,y,zpos);
  box(18,18,12);
  //rect(x,y,20,20);
  
   if (ydir == 1) rotateY(-PI/8);
  else rotateX(PI/8);
 
  
  if (random(0,1) > .99) 
  {
    r = random(255);
    g = random(255);
    b = random(255);
    stroke(r,g,b);
    xpos = random(0,width);
    ypos = random(0,height);
    if (quant == 1) {
      xpos = int(random(0,xdiv))/xdiv*width;
      ypos = int(random(0,ydiv))/ydiv*height;
    }
    xdir *= -1;
    ydir *= -1;
    xon *= -1;
    angle = random(2*PI);
    zpos = random(-500,500);
    println("reset, xpos", xpos, "ypos",ypos, "zpos",zpos, "angle",angle);
    
  }
  
  
 
  
  
}
