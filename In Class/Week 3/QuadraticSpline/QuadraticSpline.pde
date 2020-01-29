
PVector draggingPoint;
ArrayList<PVector> points = new ArrayList<PVector>(); 
float radius = 10; 

void setup() {
  size(800, 500);
  /*
  points.add( new PVector(100, 100));
   points.add(new PVector(400, 400));
   points.add(new PVector(700, 100));
   points.add(new PVector(750, 400));
   */

  for (int i =0; i < random(10, 25); i++) {
    float x = random(0, width);
    float y = random(0, height);
    points.add(new PVector(x, y));
  }
}

void draw() {
  background(128);
  //drawCurve(a,b,c);
  drawSpline();
  drawAncors();
  float time =  millis()/1000.0;
  float p = map(sin(time),-1,1,0,1);
  PVector d = spline(p);
  fill(255,0,0);
  ellipse(d.x,d.y,5,5);
  fill(255);
}

PVector spline(float p){
  p = constrain(p, 0, 1);
  int numCurves = points.size() - 2;
  float percentPerCurve = 1.0 / numCurves;

  int index = 1;

  while (p > percentPerCurve) {
    p -= percentPerCurve;
    index++;
  }

  p /= percentPerCurve;
  PVector a = points.get(index-1);
  PVector b = points.get(index);
  PVector c = points.get(index+1);

  if (index > 1) a = PVector.lerp(a, b, .5);
  if (index < numCurves) c = PVector.lerp(b, c, .5);

  PVector fin = bez(a, b, c, p);
  return fin;
}




void drawSpline() {
  int numCurves = points.size() -2;

  for (int i = 1; i <= numCurves; i++) {
    PVector a = points.get(i-1);
    PVector b = points.get(i);
    PVector c = points.get(i+1);

    if (i > 1) a = PVector.lerp(a, b, .5);
    if (i < numCurves) c = PVector.lerp(b, c, .5);

    drawCurve(a, b, c);
  }
}

void drawCurve(PVector a, PVector b, PVector c) {
  int res = 300;
  //                    PVector pointPrev = 
  for (int i = 0; i<=res; i++) {
    float p = i/(float)res;
    PVector pt = bez(a, b, c, p);

    //line()
    noStroke();
    ellipse(pt.x, pt.y, 5, 5);
    stroke(0);
  }
}

PVector bez(PVector a, PVector b, PVector c, float p) {
  p = constrain(p, 0, 1);

  PVector p1 = PVector.lerp(a, b, p);
  PVector p2 = PVector.lerp(b, c, p);
  return PVector.lerp(p1, p2, p);
}

PVector bez(PVector a, PVector b, PVector c, PVector d, float p) {
  p = constrain(p, 0, 1);

  PVector p0 = PVector.lerp(a, b, p);
  PVector p1 = PVector.lerp(b, c, p);
  PVector p2 = PVector.lerp(c, d, p);

  PVector p3 = PVector.lerp(p0, p1, p);
  PVector p4 = PVector.lerp(p1, p2, p);

  return PVector.lerp(p3, p4, p);
}





void mouseReleased() {
  draggingPoint = null;
}

void mousePressed() {
  draggingPoint = null;

  for (PVector p : points) {
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

void drawAncors() {
  if (draggingPoint != null) {
    draggingPoint.x += mouseX - pmouseX;
    draggingPoint.y += mouseY - pmouseY;
  }
  for (int i = 0; i < points.size(); i++) {
    PVector v = points.get(i);

    if (i>0) {
      PVector pp = points.get(i-1);
      stroke(100);
      line(v.x, v.y, pp.x, pp.y);
    }


    ellipse(v.x, v.y, radius, radius);
  }
}
