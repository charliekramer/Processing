
int rows = 5;
int cols = 10;
float xOff = 0;
float yOff = 0;
float dampening = .999;



int locX[][] = new int[cols][rows];
int locY[][] = new int[cols][rows];
int locX_[][] = new int[cols][rows];
int locY_[][] = new int[cols][rows];


void setup() {
   size(900, 450);
   background(255);
   
  for (int i = 0; i < cols; i ++) {
    for (int j = 0; j < rows; j ++) {
      locX[i][j] = 0;
      locY[i][j] = 0;
      
      locX_[i][j] = 0;
      locY_[i][j] = 0;
    }
  }
}




void draw() {
  
  background(255);
  stroke(0);
  strokeWeight(10);
  fill(0);
  
  //ellipse(width/2,height/2,20,20);
  
  for (int i = 1; i < cols-1; i++) {
    for (int j = 1; j < rows-1; j++) {
      
      locX[i][j] = 
                  (locX_[i+1][j] +
                   locX_[i][j+1] +
                   locX_[i-1][j] +
                   locX_[i][j-1])/ 60
                   - locX[i][j];
                   locX[i][j] = locX[i][j]/1;
             
      locY[i][j] = 
                  (locY_[i+1][j] +
                   locY_[i][j+1] +
                   locY_[i-1][j] +
                   locY_[i][j-1])/ 60
                   - locY[i][j];
                   locY[i][j] = locY[i][j]/1;
                   
    }
  }
  
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      xOff = width/cols*(.5 + 1.*i)+locX[i][j];
      yOff = height/rows*(.5 + 1.*j)+locY[i][j];
      ellipse(xOff,yOff,height/rows*.25,height/rows*.25);
      if (xOff > width || xOff < 0) locX[i][j] = - locX[i][j]/10;
      if (yOff > height || yOff < 0) locY[i][j] = - locY[i][j]/2;
      //delay(250);
    }
  }
  
   for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
     //locX[i][j] += 2*(noise(i,j))*random(-1,1);
    // locY[i][j] += 2*(noise(i,j))*random(-1,1);
     if(mousePressed) {
       locX[int(1.*mouseX/(1.*width)*cols)][int(1.*mouseY/(1.*height)*rows)] += .1;
       locY[int(1.*mouseX/(1.*width)*cols)][int(1.*mouseY/(1.*height)*rows)] += 1;
       
      }
    }
   }
   
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      locX_[i][j] = locX[i][j];
      locY_[i][j] = locY[i][j];
     
    }
  }  
  
    for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      locX[i][j] = -locX[i][j];
      locY[i][j] = -locY[i][j];
     
    }
  }
  
  
  if (keyPressed) {
    for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      locX[i][j] = -locX[i][j];
      locY[i][j] = -locY[i][j];
     
    }
  }  
  }
  
  
}
