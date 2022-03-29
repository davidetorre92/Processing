PVector[] walkers;
int n;
void setup() {

  size(500, 500);
  n = 20;
  walkers = new PVector[n];
  for (int i = 0; i < n; i++)
  {
    walkers[i] = new PVector(random(width), random(height));
  }
}

void draw()
{
  background(192);
  for (int x = 0; x < width; x++)
  {
    for (int y = 0; y < height; y++)
    {
      stroke(plasma(int(int(200 * noise(x*0.02, y*0.02, sin(frameCount/120.*PI)))/20), 0, 10));
      point(x, y);
    }
  }
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

  x = map(x, a, b, 8, 0);
  red   = ar*x*x*x+br*x*x+cr*x+dr;
  green = ag*x*x*x+bg*x*x+cg*x+dg;
  blue  = ab*x*x*x+bb*x*x+cb*x+db;
  return color(red, green, blue);
}
