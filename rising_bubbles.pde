// The method I used is based off using arrays to store the position and
// size of individual circles. ~50 lines of code without my useless rantin' commenting

float[] circlePosX; // Contains x-coordinates of the circle
float[] circlePosY; // Contains array holds y-coordinates of the circle
float[] circleSizeArr; // Contains the size of each circle
int i = 0;          // Contains the current array position for each frame
float counter;      // Crude way of limiting how fast the bubbles are produced
float circleSize = 20; // Initial size of the circles
int streamLength; // How many circles will be produced before they disappear

void setup() {
  fullScreen();
  noStroke();
  frameRate(60);
  fill(255, 255, 255, 120);

  streamLength = height/20; // Make streamlength dependent on height
  circlePosX = new float[streamLength];
  circlePosY = new float[streamLength];
  circleSizeArr = new float[streamLength];

  // Initially fill the entire circle size array with size = 20. 
  for (int i = 0; i < streamLength; i++) {
    circleSizeArr[i] = 20;
  }
}

void draw() {
  background(18, 139, 183);

  // Counter increases by 1 every frame. Whenever counter is divisible
  // by 20, create an ellipse. This is a crude way of limiting
  // rate of production without compromising frame rate because we
  // need that smooth, cinematic experience. 
  if (counter % 10 == 0) {
    // Store the current mouseX, mouseY and circle size in the ith element of
    // their respective arrays. This allows the properties of each circle
    // to be changed independently.
    circlePosX[i] = mouseX; 
    circlePosY[i] = mouseY;
    circleSizeArr[i] = circleSize;
    ellipse(circlePosX[i], circlePosY[i], circleSizeArr[i], circleSizeArr[i]);
    i++;

    // This loops the array position i back to the start so we can reuse our
    // data-storing arrays circlePosX, circlePosY and circleSizeArr.
    if (i == streamLength-1) { 
      i = 0;
    }
  }

  // Using a for loop, we can loop through our arrays that contain the 
  // position and size of independent circles. For every circle's y-position,
  // we will decrease the value at a decreasing rate so that the bubble
  // 'floats' to the top (pun intended). Then, we will draw the circle.
  // This can be seen easily by not redrawing the background at the start of 
  // draw(). 
  for (int j = 0; j < circlePosX.length; j++) {
    circlePosY[j] -= (2 + circlePosY[j]/60)/2;
    ellipse(circlePosX[j], circlePosY[j], circleSizeArr[j], circleSizeArr[j]);
  }

  // Keep increasing counter
  counter++;
  
  //Prevent counter from getting too big
  if (counter > 100) {
    counter = 1;
  }
}

void mousePressed() {
  circleSize += 20;
}
