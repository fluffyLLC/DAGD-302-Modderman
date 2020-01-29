PVector a = new PVector(100, 100);
PVector b = new PVector(400, 400);
PVector c = new PVector(700, 100);
PVector draggingPoint;
ArrayList<PVector> clickPoints = new ArrayList<PVector>(); 
float radius = 10; 

void setup() {
  size(800, 500);
  clickPoints.add(a);
  clickPoints.add(b);
  clickPoints.add(c);
}

void draw() {
  background(128);
  drawCurve();
  drawAncorsCubic();
  if (draggingPoint != null) {
    draggingPoint.x += mouseX - pmouseX;
    draggingPoint.y += mouseY - pmouseY;
  }
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
  PVector p1 = PVector.lerp(a, b, p);
  PVector p2 = PVector.lerp(b, c, p);
  return PVector.lerp(p1, p2, p);
}

void drawCurve() {
  int res = 3000;
  //PVector pointPrev = 
  for (int i = 0; i<=res; i++) {
    float p = i/(float)res;
    PVector pt = bez(a, b, c, p);
    
    //line()
    ellipse(pt.x, pt.y, 5, 5);
  }
}

void mouseReleased() {
  draggingPoint = null;
}

void drawAncorsCubic() {
  stroke(100);
  line (a.x, a.y, b.x, b.y);
  line (c.x, c.y, b.x, b.y);
  stroke(0);
  ellipse(a.x, a.y, radius, radius);
  ellipse(b.x, b.y, radius, radius);
  ellipse(c.x, c.y, radius, radius);
}
