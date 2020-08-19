/**
 * Extrusion. 
 * 
 * Converts a flat image into spatial data points and rotates the points
 * around the center.
 */

PImage a;
boolean onetime = true;
int[][] aPixels;
int[][] values;
float angle;

void setup() {
  //size(640, 360, P3D); // original
  //size(1048, 1048, P3D); // green binary
  //size(840,473,P3D); // waffle house
  size(1080,1080,P3D); // hexagon
  
  aPixels = new int[width][height];
  values = new int[width][height];
  noFill();

  // Load the image into a new array
  // Extract the values and store in an array
  //a = loadImage("green_binary.jpg");
  a = loadImage("waffle_house.jpeg");
   a = loadImage("hexagon.jpg");
 
  a.loadPixels();
  for (int i = 0; i < a.height; i++) {
    for (int j = 0; j < a.width; j++) {
      aPixels[j][i] = a.pixels[i*a.width + j];
      values[j][i] = int(blue(aPixels[j][i]));
      
    }
  }
}

void draw() {
  background(0);
  translate(width/2, height/2, -height/2);
  scale(2.0);
  
  // Update and constrain the angle
  angle += 0.005;
  rotateY(angle);  
  rotateZ(angle);
  rotateX(angle);
  
  // Display the image mass
  for (int i = 0; i < a.height; i += 4) {
    for (int j = 0; j < a.width; j += 4) {
      //stroke(values[j][i], 255);
      stroke(255, 125,0,255);
      
      //line(j-a.width/2, i-a.height/2, -values[j][i], j-a.width/2, i-a.height/2, -values[j][i]-10);
      line(j-a.width/2, i-a.height/2, -values[j][i]/10, j-a.width/2, i-a.height/2, -values[j][i]/10*(1+2*sin(frameCount*.01)));
    
    }
  }
}
