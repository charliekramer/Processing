 int j = 0;
 
void setup() {
  size(1200, 800);
 
}
void draw() {
  
  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    // Pick a random number, 0 to 255
    float rand = random(255);
    // Create a grayscale color based on random number
    color c = color(rand);
    // Set pixel at that location to random color
    pixels[i] = color(sin(i*j*.001)*255*random(.9,1.1),cos(i*j*.002)*255*random(.9,1.1),tan(i*j*.003)*255*random(.9,1.1));
  }
  // When we are finished dealing with pixels
  updatePixels();
  delay(250);
  j++;
}
