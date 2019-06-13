float i=0;
float x = 0;
float y = 0;
float z = 1 ;
float v = 20;
void setup () {


  size(1280, 720);
  line(100, 50, 600, 250);
}

void draw() {
  i++;
  pushMatrix();
  rotate(radians(2*i*(1+z)/100*PI));
  rect(x+10*i, y+5*i, v, v, -i);
  popMatrix();

  if (i == 200) {
    i = 0;
    x = random(width/5);
    y = random(height/5);
    fill (random(255), random(255), random(255));
    z = random(-75, 75);
    v = random(10,50);
  }
}

void mousePressed () {
  background(200);
}
