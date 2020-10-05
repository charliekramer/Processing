
void setup() {
  size(400,300);
}

float leftPos, rightPos, hiPos, loPos;

void draw() {
  fill(0,7);
  rect(0,0,width,height);
  stroke(random(255), random(255), random(255));
 
  leftPos = (1+sin(frameCount)/2)*height;
  rightPos = (1+cos(frameCount)/2)*height;
  
  hiPos = (1+sin(frameCount)/2)*width;
  loPos = (1+cos(frameCount)/2)*width;

 
  //leftPos = (1+sin(frameCount*sin(frameCount))/2)*height;
  //rightPos = (1+cos(frameCount*cos(frameCount))/2)*height;
  
  //leftPos = (1+sin(frameCount)/(2.5+.5*sin(frameCount/20)))*height;
  //rightPos = (1+cos(frameCount)/(2.5+.5*cos(frameCount/20)))*height;
  
  strokeWeight(1*(1+sin(frameCount/200)));
  line(0, leftPos, width, rightPos);
  line(0, height-leftPos, width, height-rightPos);
  strokeWeight(1*(1+cos(frameCount/200))); 
  line(loPos, 0, hiPos, height);
  line(width-loPos, 0, width-hiPos, height);

}
  
  
