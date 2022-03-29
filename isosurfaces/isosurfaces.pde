Ball[] balls;
int n;
float ns_dtheta;
void setup() {
  size(1080, 1080);
  n = 30;
  ns_dtheta = 0.01;
  balls = new Ball[n];
  
  for (int i = 0; i < n; i++) {
    balls[i] = new Ball(4, ns_dtheta);
  }
}

void draw() {
  if(frameCount * ns_dtheta >= TWO_PI) exit();
  int n_col = 10;
  background(244);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float sum = 0.;
      for (Ball b : balls) {
        float d = dist(x, y, b.x, b.y);
        sum += 200 * b.r / d;
      }
      int index = x + y * width;
      sum = constrain((int)(sum),0,256);
      sum = (int)(sum/256*(n_col+1));
      pixels[index] = plasma(sum, 0, n_col+1);
    }
  }
  noFill();
  stroke(1);
  for (Ball b : balls) {
    b.update();
  }

  updatePixels();
  saveFrame("instagram/frame-######.png");
}

color plasma(float x, float a, float b) {
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

  x = map(x, a, b, 0, 8);
  red   = ar*x*x*x+br*x*x+cr*x+dr;
  green = ag*x*x*x+bg*x*x+cg*x+dg;
  blue  = ab*x*x*x+bb*x*x+cb*x+db;
  return color(red, green, blue);
}
