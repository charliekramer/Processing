// up, down = change mode
// move mouse = mod parameter

PImage img;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system
float index = 0;
float chooser = 1;
float z;

void setup() {
  size(640, 480, P3D); 
  img  = loadImage("doggos.jpg"); // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
}

void draw() {
  index++;
  background(0);
  loadPixels();
  // Begin loop for columns
  for ( int i = 0; i < cols; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color

      if (chooser == 1) {
         z = (mouseX/(float)width) * brightness(img.pixels[loc]) - 100.0;
      } else if (chooser == 2) {
         z = (sin(index*.5*mouseX/width)*random(1)) * brightness(img.pixels[loc]) - 100.0;
      } else if (chooser == 3) {
         z = (sin((i+j+index)*.1*mouseX/width)) * brightness(img.pixels[loc]) - 100.0;
      }


      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x, y, z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}

void keyPressed() {
  if (keyCode == UP) chooser++;
  if (keyCode == DOWN) chooser--;
  if (chooser > 3 || chooser < 1) chooser = 1;
}
