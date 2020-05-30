/**
 * Brightness
 * by Daniel Shiffman. 
 * 
 * This program adjusts the brightness of a part of the image by
 * calculating the distance of each pixel to the mouse.
 */

PImage img;
float t = 0;
float dt = 0.5;
float locX = 0;
float locY = 0;
float maxD = 50;

void setup() {
  //size(640, 360);
  size(1080,1080,P3D); // hexagon
  frameRate(30);
  img = loadImage("hexagon.jpg");
  img.loadPixels();
  // Only need to load the pixels[] array once, because we're only
  // manipulating pixels[] inside draw(), not drawing shapes.
  loadPixels();
  locX = width/2;
  locY = height/2;
}

void draw() {
  //locX += random(-2,4);
  locX += 1;;
  //locY += random(-4,2);
  if (locX > width) locX = 0;
  if (locX < 0) locX = width;
  if (locY > height) locY = 0;
  if (locY < 0) locY = height;
  /*
  if ((1+sin(t)) < .05) {
    locX = random(0,width);
    locY = random(0,height);
    maxD = random(25,75);
  }
  */
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      // Calculate the 1D location from a 2D grid
      int loc = x + y*img.width;
      // Get the R,G,B values from image
      float r,g,b;
      r = red (img.pixels[loc]);
      g = green (img.pixels[loc]);
      b = blue (img.pixels[loc]);
      // Calculate an amount to change brightness based on proximity to the mouse
      float maxdist = (.3+.2*sin(t*.2))*random(maxD/2,maxD);//dist(0,0,width,height);
      float d = dist(x, y, locX, y);
      float adjustbrightness = 255*(maxdist-d)/maxdist;
      r += adjustbrightness;
      g += adjustbrightness;
      b += adjustbrightness;
      // Constrain RGB to make sure they are within 0-255 color range
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);
      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      //color c = color(r);
      pixels[y*width + x] = c;
    }
  }
  updatePixels();
  t += dt;
}
