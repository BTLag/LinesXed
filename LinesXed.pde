
int p1x,p1y,p2x,p2y,p3x,p3y,p4x,p4y;

void setup(){
  size(500,500);
  flingDots();
}

void draw(){
  background(80, 0, 60);
  if(linesXed(p1x,p1y,p2x,p2y,p3x,p3y,p4x,p4y)){
    stroke(150);
  } else {
    stroke(50);
  }
  strokeWeight(20);
  line(p1x,p1y,p2x,p2y);
  line(p3x,p3y,p4x,p4y);
  noStroke();
  fill(250);
  ellipse(p1x,p1y,50,50);
  ellipse(p2x,p2y,50,50);
  ellipse(p3x,p3y,50,50);
  ellipse(p4x,p4y,50,50);
  fill(0);
  textAlign(CENTER,CENTER);
  text("1",p1x,p1y);
  text("2",p2x,p2y);
  text("3",p3x,p3y);
  text("4",p4x,p4y);
  dragDots();
}

boolean linesXed(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4){
  if(x2 < x3){//p1,p2,p3,p4
    return(false);
  } else if(x2 < x4){//p1,p3,p2,p4
    return(true);
  } else {//p1,p3,p4,p2
    if(yOfLineAtX(x1, y1, x2, y2, p3x) > p3y){//ln(p1,p2) is above p3 at x(p3)
      if(yOfLineAtX(x1, y1, x2, y2, p4x) > p4y){//ln(p1,p2) is above p4 at x(p4)
        return(false);//l1 is fully above l2
      } else {//l1 starts off above but ends up bellow
        return(true);
      }
    } else {//ln(p1,p2) is below p3 at x(p3)
      if(yOfLineAtX(x1, y1, x2, y2, p4x) > p4y){//ln(p1,p2) is above p4 at x(p4)
        return(true);//l1 starts off bellow but ends up above
      } else {//l1 is fully bellow l2
        return(false);
      }
    }
  }
}

void dragDots(){
  if(mousePressed && selectedDot != 0){
    if(selectedDot == 1){
      p1x = mouseX;
      p1y = mouseY;
    } else if(selectedDot == 2){
      p2x = mouseX;
      p2y = mouseY;
    } else if(selectedDot == 3){
      p3x = mouseX;
      p3y = mouseY;
    } else if(selectedDot == 4){
      p4x = mouseX;
      p4y = mouseY;
    }
    organizeDots();
  }
}

void flingDots(){
  p1x = round(random(50,450));
  p1y = round(random(50,450));
  p2x = round(random(50,450));
  p2y = round(random(50,450));
  p3x = round(random(50,450));
  p3y = round(random(50,450));
  p4x = round(random(50,450));
  p4y = round(random(50,450));
  organizeDots();
}

int selectedDot = 0;

void mousePressed(){
  if(dist(p1x,p1y,mouseX,mouseY) < 30){
    selectedDot = 1;
  } else if(dist(p2x,p2y,mouseX,mouseY) < 30){
    selectedDot = 2;
  } else if(dist(p3x,p3y,mouseX,mouseY) < 30){
    selectedDot = 3;
  } else if(dist(p4x,p4y,mouseX,mouseY) < 30){
    selectedDot = 4;
  } else {
    selectedDot = 0;
  }
}

void organizeDots(){
  //make sure p1 is to the left of p2 and p3 is to the left of p4
  int XedTemp;
  if (p1x > p2x) {
    XedTemp = p1x;
    p1x = p2x;
    p2x = XedTemp;
    XedTemp = p1y;
    p1y = p2y;
    p2y = XedTemp;
    if(selectedDot == 1){
      selectedDot = 2;
    } else if (selectedDot == 2){
      selectedDot = 1;
    }
  }
  if (p3x > p4x) {
    XedTemp = p3x;
    p3x = p4x;
    p4x = XedTemp;
    XedTemp = p3y;
    p3y = p4y;
    p4y = XedTemp;
    if(selectedDot == 3){
      selectedDot = 4;
    } else if (selectedDot == 4){
      selectedDot = 3;
    }
  }
  //make sure line p1-p2 is left most
  if (p1x > p3x) {
    XedTemp = p1x;
    p1x = p3x;
    p3x = XedTemp;
    XedTemp = p1y;
    p1y = p3y;
    p3y = XedTemp;

    XedTemp = p2x;
    p2x = p4x;
    p4x = XedTemp;
    XedTemp = p2y;
    p2y = p4y;
    p4y = XedTemp;
    if(selectedDot == 1){
      selectedDot = 3;
    } else if (selectedDot == 2){
      selectedDot = 4;
    } else if(selectedDot == 3){
      selectedDot = 1;
    } else if (selectedDot == 4){
      selectedDot = 2;
    }
  }
}

int dist(int x1,int y1, int x2, int y2){
  return(round(sqrt(( (x1-x2)*(x1-x2) ) + ( (y1-y2)*(y1-y2) ))));
}

float slope(int x1, int y1, int x2, int y2){
  return(-1.0*(float(y1-y2)/float(x1-x2)));
}

int yOfLineAtX(int x1, int y1, int x2, int y2, int x){
  if(x < x1 || x > x2){
    println("Error in yOfLineAtX. X is out of bounds.");
    return(0);
  }
  return(round(float((x - x1))*slope(x1,y1,x2,y2))+y1);
}
