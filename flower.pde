PImage img;
int cols, rows;
int fixX,fixY;

void setup() {
  size(450,300);
  
  img = loadImage("maarten-deckers-YDNvydD1jAY-unsplash.jpg");
  cols = width;
  rows = height;
  fixX = int(random(width));
  fixY = int(random(height));
}

void draw() {
  image(img, 0, 0, img.width/10, img.height/10);
  
  
  
  loadPixels();
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      int index = i + j*cols;
      //if (i > j) {
        //pixels[index] = pixels[int(   pow(index*((1+sin(frameCount/20))*.5),cos(frameCount/50))    )];
        //}
      //if (j % 5 < 2*(.9+sin(frameCount/20.)) ) pixels[index] = pixels[max(index - 10*cols,0)]; 
      //pixels[index] = pixels[index-1]*int(100*noise(i,j));
      //pixels[index] = pixels[int(width*abs(sin(index/abs(10*cos(frameCount/100.)))))];
    pixels[index] = pixels[index % (3*(int(.1*frameCount) % 300)+1)];
   }
  }
  
  updatePixels();
  
}
