import processing.svg.*;

void setup() {
  //size(500, 500, SVG, "out.svg");
  size(500, 500);
  noFill();
  strokeWeight(1);
}

void draw() {
  translate(width*0.5, height*0.5);
  
  background(61,64,91); //Eggshell
  stroke(244,241,222);          
  rose(3,animateGaussian(0,0.5,5,20));
  if(frameCount>200) exit();
  saveFrame("output/frame-####.png");
}

void rose(float a, float f){
  float maxTheta = 6*TWO_PI;
  float dtheta = 0.01;
  float r = width/5.;
  beginShape();
  for(float theta=0; theta<=maxTheta; theta+=dtheta){
    float x = cos(theta+HALF_PI) - f*cos(a * theta+HALF_PI);
    float y = sin(theta+HALF_PI) + f*sin(a * theta+HALF_PI);
    vertex(r*x, r*y);
  }
  endShape();
}

float animateGaussian(float min, float max, float mean, float std){
  float t = frameCount/std;
  t -= mean;
  if(t < 0) return (max-min)*exp(-t*t)+min;
  if(t >=0 && t<2) return max;
  if(t >= 2) t-=2; return (max-min)*exp(-t*t)+min;
}
