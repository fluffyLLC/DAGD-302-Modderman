void setup() {
  size(500, 500);
}

void draw() {
  background(128);

  // what is linerar interpolation?
  // given a range of nimbers and a percent 
  // return a corresponding number at that percent

  //drive percent with mouse position:
  //float p = mouseX / (float) width;

  //Drive percent with Time:
  float p = millis() / (float)5000;

  //float size =  lerpCust(100, 500, p);

  float size = mapCust(millis(), 0, 5000.0, 100, 500);

  ellipse(250, 250, size, size);
}


float mapCust(float value, float min1, float max1, float min2, float max2) {
  float range = max1 - min1;
  float p = (value - min1)                                                                                                                                                                                                                                                                                                                                                                                                                                                       / range;
   
  float output = min2 + (max2 - min2)*p;
  
  return output;
}



//function override!
float lerpCust(float min, float max, float p) {
  return lerpCust(min, max, p, true);
}

float lerpCust(float min, float max, float p, boolean allowExtrapolation) {

  if (!allowExtrapolation) {
    if (p > 1) p = 1;
    if (p < 0) p = 1;
  }

  float range = max - min;
  float output = min + (range*p);

  return output;
}
