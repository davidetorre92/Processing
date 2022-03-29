float r, max_noise;

void setup() {
  size(500, 500);
  r = 50;
  max_noise = 200;
  strokeWeight(2);
}

void draw() {
  float dtheta = 0.001;
  int N = int(TWO_PI/dtheta);
  int half_N = N/2;
  int t = frameCount;
  int t_start = 0;
  float tsc = 10*30./TWO_PI;
  float T = (t-t_start)/tsc;
  float noise_amount = max_noise*sin(T);
  background(244);
  translate(width/2, height/2);
  noFill();
  float theta = 0.;
  for (int i = 0; i <= N; i++) {
    stroke(viridis(abs(half_N-i), 0, half_N));
    float R = r + noise_amount * noise(r*(1+sin(theta*0.5))+sin(T));
    float x1 = R*cos(theta);
    float y1 = R*sin(theta);
    theta += dtheta;
    float x2 = R*cos(theta);
    float y2 = R*sin(theta);
    line(x1, y1, x2, y2);
  }
  if(T>TWO_PI) exit();
  saveFrame("output/frame-####.png");
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
