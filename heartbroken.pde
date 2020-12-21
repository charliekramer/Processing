
float xpos,ypos;
void setup() {
  
  size(600,600,P3D);
  frameRate(10);
  xpos = width/2;
  ypos = height/2;
  
}

void draw() {
  noStroke();
  fill(0,6);
  rect(0,0,width,height);
  stroke(157*abs(cos(frameCount/2000.)),255,200*abs(sin(frameCount/1000.)));
  strokeWeight(10*abs(sin(frameCount/50.)));
  line(0,0,xpos+random(-100,100), ypos+random(-200,200));
  
  strokeWeight(10*abs(sin(frameCount/55.)));
  line(width,0,xpos+random(-100,100), ypos+random(-200,200));
  
  strokeWeight(10*abs(sin(frameCount/60.)));
  line(0,height,xpos+random(-100,100), ypos+random(-200,200));
  
  strokeWeight(10*abs(sin(frameCount/65.)));
  line(width,height,xpos+random(-100,100), ypos+random(-200,200)); 
  
  strokeWeight(10*abs(sin(frameCount/70.)));
  line(width/2,0,xpos+random(-100,100), ypos+random(-200,200));
  
  strokeWeight(10*abs(sin(frameCount/75.)));
  line(0,height/2,xpos+random(-100,100), ypos+random(-200,200));
  
  strokeWeight(10*abs(sin(frameCount/80.)));
  line(width,height/2,xpos+random(-100,100), ypos+random(-200,200));
  
  strokeWeight(10*abs(sin(frameCount/85.)));
  line(width/2,height,xpos+random(-100,100), ypos+random(-200,200));
  
  if (random(0,1) > .995) fill(0,255);
  rect(xpos-width/4. - random(-10,10), ypos-height/4. - random(-10,10), 
       xpos- random(-10,10), ypos - random(-10,10));
      
       
  rect(xpos-width/8. - random(-5,5), ypos-height/8. - random(-5,5), 
       width/4 - random(-5,5), height/4 - random(-5,5));
       
       
  rect(xpos-width/16. - random(-2,2), ypos-height/16. - random(-2,2), 
       width/8 - random(-2,2), height/8 - random(-2,2));
       
       stroke(0);
      fill(0,255); 
       ellipse(xpos,ypos,20,20);
       
  
  
  delay(int(250.*abs(sin(frameCount/45.)))+10); 
}
