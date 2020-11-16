float xpos, ypos, dxpos, dypos, xD,xU,yD,yU;

void setup() {
  
  size(1200,800,P3D);
  xpos = width/2;
  ypos = height/2;
  dxpos = 1;
  dypos = 1;
  xD = -2;
  yD = -1;
  xU = 5;
  yU = 3;
  
  
}

void draw() {
  fill(0,24);
  rect(0,0, width,height);
  translate(xpos,ypos);
  if (random(0.,1) > .9) 
  {
    background(255);
     stroke(0);
  float radius = abs(sin(frameCount))*200;
  ellipse(radius*.25, -radius*.15, radius*.1, radius*.1);// right eye
  ellipse(-radius*.25, -radius*.15, radius*.1, radius*.1); // left eye
  ellipse(0,0,5,5); //nose
  line(-radius*.25, radius*.2, radius*.25, radius*.2);

    delay(int(random(1,100)));
  }
  stroke(255);
  float radius = abs(sin(frameCount/5))*200;
  ellipse(radius*.25, -radius*.15, radius*.1, radius*.1);// right eye
  ellipse(-radius*.25, -radius*.15, radius*.1, radius*.1); // left eye
  ellipse(0,0,5,5); //nose
  line(-radius*.25, radius*.2, radius*.25, radius*.2);
  xpos += dxpos*random(xD,xU);
  ypos += dxpos*random(yD,yU);
  if (xpos <= radius || xpos >= width-radius) {
    dxpos *= -1;
    xD = random(-10,-3);
    xU = random(3,10);
  }
  
  if (ypos <= radius || ypos >= height-radius) {
    dypos *= -1;
   yD = random(-10,-3);
   yU = random(3,10);
    
  }
  println(xpos,ypos,xD,xU,yD,yU);
}
