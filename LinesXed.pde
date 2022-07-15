
int p1x,p1y,p2x,p2y,p3x,p3y,p4x,p4y;

void setup(){
  size(500,500);
  flingDots();
}

void draw(){
  background(80, 0, 60);
  stroke(20);
  strokeWeight(20);
  line(p1x,p1y,p2x,p2y);
  line(p3x,p3y,p4x,p4y);
  fill(100);
  noStroke();
  ellipse(p1x,p1y,50,50);
  ellipse(p2x,p2y,50,50);
  ellipse(p3x,p3y,50,50);
  ellipse(p4x,p4y,50,50);
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
}
