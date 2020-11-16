float xpos, ypos, dxpos, dypos;

void setup() {
  
  size(900,700,P3D);
  xpos = width/2;
  ypos = height/2;
  dxpos = 1;
  dypos = 1;
  
  
}

void draw() {
 translate(xpos,ypos);
 background(0);
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
  xpos += dxpos*random(-2,2);
  ypos += dxpos*random(-2,2);
  if (xpos < 0 || xpos > width) dxpos *= -1;
  
  if (ypos < 0 || ypos > height) dypos *= -1;
}
