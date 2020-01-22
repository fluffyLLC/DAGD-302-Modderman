void setup() {
  size(1920, 1080);
  frameRate(120);
}
float radius = 1;
int NumPic = 0;
float move = 0;
int firstCount = 0;
//String rand; 

void draw() {
  drawbackground(firstCount == 0);
  // update: 
  float time = millis()/1000.0;
  //radius = sin(time*5)*100 + 200;

  stroke(color(0));
  float x = (width/2 + 200 * cos(time))+(sin(time)*move);
  float y = (height/2 + 300 * sin(time));// - (cos(time)*500);
  move = time;
  
  //draw:
  //background(128);
  ellipse(x, y, radius * 2, radius *2);






  //println(keyCode);
  if (keyPressed) {
    saveFrame("Render -#####.Tif");
  }
}

color ColorMid = color(255, 138, 0);
color ColorEdge = color(102, 0, 255);
void drawbackground(Boolean drawBackground) {

  if (drawBackground) {
    for (int i = 0; i <=height; i++) {

      float a;
      if (i < height/2) {
        a = (float)i/((float)height/2);
       // a -= 1;
      } else {
        float r = height - height/2;
        float c = i - height/2;
        float p = c/r;
        p *= -1;
        p += 1;
        println(p);
        a = p; //(float)i-((float)height/2)/((float)height);
      }



      stroke(lerpColor(ColorEdge,ColorMid, a));
      line(0, i, width, i);
    }
    firstCount++;
  }
}
