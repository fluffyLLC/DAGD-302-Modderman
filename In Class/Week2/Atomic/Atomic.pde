// Animate 3 electrons orbiting around a nucleus.
// Each electron should follow a path and match
// colors with its respective path.
// To mathematically determine the position of
// the electrons, look at the example electron.
// Notice that before we translate it (add 200
// to x and 200 to y), it is orbiting the origin.
// Its position is a vector, so we can easily get
// its magnitude and angle from the origin.
// Once we have the angle, it should be obvious
// that we need to modify the angle then
// recalculate x and y from angle and magnitude.
// Finally, you would translate it 200, 200.
// Do all of this with trigonometry and Vectors.

void setup(){
  size(400, 400);
}
float radius = 5;
void draw(){
  background(0);
  drawAtomBG();
  ///////////////// START YOUR CODE HERE:
  
  stroke(100,100,255);
  float time = millis()/1000.0;
  float x = (width/2 + 55 * cos(time))+(sin(time)*70);
  float y = (height/2 + 133 * sin(time));// - (cos(time)*500);
  ellipse(x, y, radius * 2, radius *2);
  
  stroke(100,255,100);
  x = (width/2 + 55 * cos(time))-(sin(time)*70);
  y = (height/2 + 133 * sin(time));// - (cos(time)*500);
  ellipse(x, y, radius * 2, radius *2);
  
  stroke(255,100,100);
  x = (width/2 + 150 * cos(time));
  y = (height/2 + 50 * sin(time));// - (cos(time)*500);
  ellipse(x, y, radius * 2, radius *2);
  
  ///////////////// END YOUR CODE HERE
  
}
void drawAtomBG(){
  noStroke();
  fill(255);
  ellipse(200,200,50,50);
  noFill();
  strokeWeight(5);
  
  pushMatrix();
  translate(200,200);
  stroke(255,100,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(PI/1.5);
  stroke(100,255,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(2*PI/1.5);
  stroke(100,100,255);
  ellipse(0,0,300,100);
  popMatrix();
}
