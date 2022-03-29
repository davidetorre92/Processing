import processing.svg.*;

int n;
PVector[] dot, dot0;
int r;
float thresholdR;
color[] col;
float margin;

void setup() {
  
  size(143, 200);
  beginRecord(SVG, "locandina.svg");
  noLoop();
  randomSeed(12345);
  n = 200;
  dot = new PVector[n];
  dot0 = new PVector[n];
  margin = 0.00625;
  for (int i=0; i<n; i++) {
    float x = width*(margin+random(1-2*margin));
    float y = width*(margin+random(1-2*margin));
    dot[i] = new PVector(x, y);
    dot0[i] = new PVector(dot[i].x, dot[i].y);
  }
  r = 1;
  thresholdR = 6.25;

  fill(11);
  strokeWeight(0.5);
  noFill();
}

void draw() {
  background(244);
  drawLines();
  drawDots();
  //updateDots();
  //saveFrame("output/frame-####.png");
  println("Finished");
  endRecord();
  exit();  
}

void updateDots() {
  float theta = frameCount / 800.*TWO_PI;
  for (int i=0; i<n; i++) {
    dot[i].x = dot0[i].x + 500*(noise(dot0[i].x + cos(theta))*2-1);
    dot[i].y = dot0[i].y + 500*(noise(dot0[i].y + sin(theta))*2-1);
  }
}

void drawLines() {
  for (int i = 0; i < n; i++) {
    for (int j=i+1; j < n; j++) {
      float r = dot[i].dist(dot[j]);
      stroke(color(#2D3047), getAlpha(r));
      line(dot[i].x, dot[i].y, dot[j].x, dot[j].y);
    }
  }
}

void drawDots() {
  noStroke();
  for (int i = 0; i < n; i++) {
    fill(plasma(dot0[i].y, 0, width*(margin+(1-2*margin))));
    ellipse(dot[i].x, dot[i].y, r, r);
  }
}

float getAlpha(float r) {
  if (r>thresholdR) {
    return 0.;
  } else {
    return map(r, 0, thresholdR, 255, 0);
  }
}

  color plasma(float x, float a, float b){
    float red, green, blue;
    float ar = -1.11111;
    float br = 6.75;
    float cr = 43.3611;
    float dr = -1;
    
    float ag = 0.997475;
    float bg = -7.6461;
    float cg = 19.5556;
    float dg = 62.9848;

    float ab = -0.111111;
    float bb = -6.79761;
    float cb = 40.0754;
    float db = 91.8333;

    x = map(x,a,b,0,8);
    red   = ar*x*x*x+br*x*x+cr*x+dr;
    green = ag*x*x*x+bg*x*x+cg*x+dg;
    blue  = ab*x*x*x+bb*x*x+cb*x+db;
    return color(red, green, blue);
  }
