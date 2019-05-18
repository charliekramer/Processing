
int nbox = 20; // needs to be same as above
float xpos[] = new float[nbox];
float ypos[] = new float[nbox];
float colorR[] = new float[nbox];
float colorB[] = new float[nbox];
float colorG[] = new float[nbox];
float xsize;
float ysize;

float xspeed[] = new float[nbox];
float yspeed[] = new float[nbox];

int j = 0;



void setup() {
  size(1280, 720);
  background(255);
  stroke(250); // 0 or 255 determines effective background
  strokeWeight(1);
  fill(random(255), random(255), random(255));

  for (int i = 0; i < xpos.length; i++) {
    xpos[i] = 0;
    ypos[i] = 0 + i*height/nbox;
    xspeed[i] = 2;
    yspeed[i] = 1;
  }
  ysize = height/nbox*.8;
  xsize = ysize;
  println(xsize, ysize, height, width);
}

void draw() {

  if (keyPressed) background(255);
  for (int i = 0; i < xpos.length; i++) {
    xpos[i] = xpos[i] + xspeed[i];
    ypos[i] = ypos[i] + yspeed[i];
    if (xpos[i] >= width || xpos[i] < 0 || ypos[i] >= height || ypos[i] < 0) {
      xpos[i] = 0 +i*width/nbox;
      ypos[i] = 0 + i*height/nbox;
      ypos[i] = random(height);
      xspeed[i] = random(-5, 5);
      yspeed[i] = random(-5, 5);
      colorR[i]=random(255); 
      colorG[i]=random(255); 
      colorB[i]=random(255); 
      strokeWeight(random(1,5));
      fill(colorR[i], colorG[i], colorB[i]);
      rect(xpos[i], ypos[i], xsize, ysize);
    } else {
      fill(colorR[i], colorG[i], colorB[i]); 
      rect(xpos[i], ypos[i], xsize, ysize);
    }
    
    ellipse(width/2,height/2,80,80);
  }
  j++;
}
