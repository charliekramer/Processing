void setup(){
  
//size(900,300);
fullScreen();
}

int i, j;

void draw() {

fill(0, 16);  
rect(0,0,width,height);
  
float nWidth = 25;
float nHeight = 15;

float radius = 10;

fill(255);
//ellipse(width/nWidth*int(random(nWidth+1)),height/nHeight*int(random(nHeight+1)), radius, radius);

for (j = 0; j < nWidth; j++) {
if (random(1) > .5) ellipse(width/nWidth*j,(i%(nHeight+1))/nHeight*height,radius,radius);
}


delay(125);

i++;
  
}
