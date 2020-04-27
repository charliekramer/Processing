BufferedReader reader;
String line;
int data[] = new int[1];
Boolean reading = true;
int zMin = 10000;
int zMax = -1;
float t = 0; // time increment for sin applied to angle of rotation
float dt = .01; // change in time per frame; 0.1, .01 work well
float scale = .5; //scale down to fit inside h x w; .5 works well
float rand = 2; // upper end of random distribution for x and y points
float radius = 10; // radius of the circles
Boolean distScale = true; // scale size of circle by distance from center
Boolean shadeShift = false; // change fill shading by sin(t)
float bkgd = 0; // background shade
 
void setup() {
  // Open the file from the createWriter() example
  size(1024, 720);
  background(bkgd);
  //reader = createReader("positions.txt"); 
  reader = createReader("literal_translation.txt");    
  
  
}
 
void draw() {
  translate(width/2, height/2);
  if (shadeShift) fill(125*(1+sin(t)));
  t = t + dt;
  if (reading) {
    try {
      line = reader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      // Stop reading because of an error or file is empty
      reading = false;
      //noLoop();  
    } else {
      //println(line);
      String[] pieces = splitTokens(line);
      for (int i = 0; i < pieces.length; i++) {
        int z = bin2dec(int (pieces[i]));
        println(z);
        if (z > zMax) zMax = z;
        if (z < zMin) zMin = z;
        data = splice( data, z ,data.length-1 );
      }
    }
  } 
  rotate(PI/sin(t));
  for (int j = 0; j < data.length-1; j++) {
     float x = map(data[j], zMin, zMax, 0, width*scale);  
     float y = map(data[j+1], zMin, zMax, 0, height*scale);
     //if (distScale) ellipse(x+random(rand),y+random(rand),log(dist(x,y,0,0))*radius/6,log(dist(x,y,0,0))*radius/6);
     if (distScale) ellipse(x+random(rand),y+random(rand),sqrt(dist(x,y,0,0))*radius/20,sqrt(dist(x,y,0,0))*radius/20);
     
     else ellipse(x+random(rand),y+random(rand),radius,radius);    
   
   }
   delay(50);
   
   }

int bin2dec(int x) {
  int out = 0;
  int base = 1;
  int temp = x;
  while(temp>0) {
    int last_digit = temp % 10;
    temp = temp / 10;
    out += last_digit*base;
    base = base*2;
  }
  return out;
}
  
