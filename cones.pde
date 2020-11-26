float lineCol = 255;
float bgCol = 0;
int j = 0;
void setup() {
  size(900,900,P3D);
}

void draw() {
  //fill(bgCol,3);
  //rect(0,0,width,height);
  stroke(lineCol);
  translate(width/2,height/2);
 rotateX(frameCount);
  line (0,0,width,height);
  line(0,0, -width,-height);
  rotateY(frameCount);
  line (0,0,width,height);
  line(0,0, -width,-height);
 
   j++;
   if (j == 1000) {
     if (bgCol == 0) {
       bgCol = 255;
       lineCol = 0;
     }
     else {
       bgCol = 0;
       lineCol = 255;
     }
     j = 0;
   }
  
}
