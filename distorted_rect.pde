  int i=0;
  float x = 0;
  float y = 0;
void setup () {


  size(1280, 720);
  line(100, 50, 600, 250);
}

void draw() {
  i++;
    rect(x+10*i,y+5*i, 20, 200, -i);
  if (i == 200) {
    i = 0;
    x = random(width/10);
    y = random(height/10);
  fill (random(255),random(255),random(255));
  }
}
