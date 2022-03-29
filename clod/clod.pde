Cloud c;
int size = 300;

void setup() {
  size(1500, 1500);
  c = new Cloud(width/2, height/2, size, color(244));
}

void draw() {
  bkg();
  stroke(11);
  c.show();
  c.update();
  saveFrame("output/frame-####.png");
}

void bkg() {
  float x, y, r;
  int n_stripes = 11;
  x = width/2;
  y = height/2;
  r = width/5*4;
  background(244);
  for (int i = n_stripes; i >= 0; i--) {
    color c = viridis(i, 0, n_stripes);
    float theta = PI/n_stripes*i;
    float theta_start = HALF_PI - theta;
    float theta_end = HALF_PI + theta;
    fill(c);
    stroke(c);
    arc(x, y, r, r, theta_start, theta_end, OPEN);
  }
  //fill(#00A1CB);
  //stroke(#00A1CB);
  //ellipse(x, y, 400, 400);
  //fill(244, 0, 0);
  //stroke(244, 0, 0);
  //arc(x, y, 400, 400, 0, PI, OPEN);
}

color viridis(float x, float a, float b) {
  float red, green, blue;
  float ar = 0.888306;
  float br = -5.63986;
  float cr = -0.0922688;
  float dr = 72.7692;

  float ag = -0.0501166;
  float bg = -0.747669;
  float cg = 36.3502;
  float dg = 2.68112;

  float ab = 0.287685;
  float bb = -7.96329;
  float cb = 42.3236;
  float db = 83.5413;

  x = map(x, a, b, 0, 10);
  red   = ar*x*x*x+br*x*x+cr*x+dr;
  green = ag*x*x*x+bg*x*x+cg*x+dg;
  blue  = ab*x*x*x+bb*x*x+cb*x+db;
  return color(red, green, blue);
}
