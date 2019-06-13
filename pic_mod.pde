PImage img;
int j = 0;


void setup() {
  size(640, 480);
  
img = loadImage("doggos.jpg");
}

void draw() {
   tint(sin(j*.01)*255,cos(j*.02)*255,tan(j*.03)*255);
   j++;
  delay(2);
 
  image(img,0,0);
 
}
