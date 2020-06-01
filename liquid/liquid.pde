float increment = .001; //.02 liquid; .001 jagged to smooth
float t = 0;
float dt = .1;
float divisor = 10; // used for mod
float multiplier = 10; // used for mod
float green = 0;


void setup() {
  size(640, 360);
}

void draw() {
  
  loadPixels();

  float xoff = 0.0; // Start xoff at 0
  float detail = map(mouseX, 0, width, 0.1, 0.7);
  noiseDetail(12, detail);
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      float bright = (int(noise(xoff, yoff, t) * 255) % divisor)*multiplier ;
     
      // Try using this line instead
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      pixels[x+y*width] = color(2*120-bright,0*map(1/(bright+.0001)+green,0,10000,0,1),bright*3);
      //pixels[x+y*width] = color(bright);
      
    
    }
  }
  
  updatePixels();
  dt = 1.*mouseY/height*.50;
  t += dt;
  if (random(0,1) > .99 || mousePressed) {
        divisor = random(1,100);
        multiplier = random(1,100);
        green = random(0,255);
        println("div, mult,, green " ,divisor, multiplier, green);
        
      }

}
