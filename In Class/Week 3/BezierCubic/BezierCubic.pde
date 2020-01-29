PVector a = new PVector(100, 100);
PVector b = new PVector(400, 400);
PVector c = new PVector(700, 100);
PVector d = new PVector(750, 400);
PVector draggingPoint;
ArrayList<PVector> clickPoints = new ArrayList<PVector>(); 
float radius = 10; 

void setup() {
  size(800, 500);
  clickPoints.add(a);
  clickPoints.add(b);
  clickPoints.add(c);
  clickPoints.add(d);
}

void draw() {
  background(128);
  drawCurve();
  drawAncors();
  float time = millis()/1000.0;
  float p = map(sin(time),-1,1,0,1);
  PVector pos = bez(a,b,c,d,p);
  fill(255,0,0);
  ellipse(pos.x,pos.y,5,5);
  fill(255);
}

void mousePressed() {
  draggingPoint = null;

  for (PVector p : clickPoints) {
    float dx = p.x - mouseX;
    float dy = p.y - mouseY;
    float d = (dx*dx + dy*dy);

    if (d < radius*radius) {
      draggingPoint = p;
      break;
    }
    //float
  }
}

PVector bez(PVector a, PVector b, PVector c, float p) {
  p = constrain(p,0,1);
  
  PVector p1 = PVector.lerp(a, b, p);
  PVector p2 = PVector.lerp(b, c, p);
  return PVector.lerp(p1, p2, p);
}

PVector bez(PVector a, PVector b, PVector c, PVector d, float p) {
  p = constrain(p,0,1);
  
  PVector p0 = PVector.lerp(a, b, p);
  PVector p1 = PVector.lerp(b, c, p);
  PVector p2 = PVector.lerp(c, d, p);
  
  PVector p3 = PVector.lerp(p0, p1, p);
  PVector p4 = PVector.lerp(p1, p2, p);
  
  return PVector.lerp(p3, p4, p);
}



void drawCurve() {
  int res = 3000;
  //                    PVector pointPrev = 
  for (int i = 0; i<=res; i++) {
    float p = i/(float)res;
    PVector pt = bez(a, b, c, d, p);
    
    //line()
    noStroke();
    ellipse(pt.x, pt.y, 5, 5);
    stroke(0);
  }
}

void mouseReleased() {
  draggingPoint = null;
}

void drawAncors() {
   if (draggingPoint != null) {
    draggingPoint.x += mouseX - pmouseX;
    draggingPoint.y += mouseY - pmouseY;
  }
  stroke(100);
  line (a.x, a.y, b.x, b.y);
  line (c.x, c.y, b.x, b.y);
  line (c.x, c.y, d.x, d.y);
  stroke(0);
  ellipse(a.x, a.y, radius, radius);
  ellipse(b.x, b.y, radius, radius);
  ellipse(c.x, c.y, radius, radius);
  ellipse(d.x, d.y, radius, radius);
}
