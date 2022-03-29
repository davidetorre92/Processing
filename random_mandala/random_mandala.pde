float r, om;
float x0, y0, x1, y1;

void setup()
{
  size(1500, 1500);
  r = om = 0;
  x0 = y0 = 0;
  background(228);
  strokeWeight(10);
  noFill();
}

void draw()
{
  float dtheta = TWO_PI/20.;
  translate(width/2, height/2);

  if (r > width/2)
  {
    translate(-width/2, -height/2);
    strokeWeight(20);
    stroke(11);
    saveFrame("instagram/color.png");
    exit();
  } else {
    random_rule();
    for (float theta = 0.; theta < TWO_PI; theta += dtheta)
    {
      stroke(plasma(r,width/2,0));
      line(x0, y0, x1, y1);
      rotate(dtheta);
    }
  }
}

void random_rule()
{
  r += 3;
  om += TWO_PI*0.001;
  x1 = r * cos(om);
  y1 = r * sin(om);
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
    return color(red, green, blue, 20);
  }
