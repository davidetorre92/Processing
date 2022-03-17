ArrayList<Circle> c;
int n = 20;
void setup()
{
  size(1980, 1080);
  c = new ArrayList<Circle>();
  float rmax, rmin;
  rmax = 432;
  rmin = 43;
  for (int i = 1; i <= n; i++)
  {

    float r = rmax - (rmax-rmin)*i/(n+0.);
    println(r);
    
    c.add(new Circle(width/2, height/2, r, sunset(r, rmax, rmin)));
  }
}

void draw()
{
  background(188);
  for (Circle circle : c)
  {
    circle.show();
  }
  if(c.get(0).dphi*frameCount > TWO_PI) exit();
  saveFrame("reddit/frame-####.png");
}

color sunset(float x, float a, float b)
{
  float ra, rb, rc, rd;
  float ga, gb, gc, gd;
  float ba, bb, bc, bd;

  ra = -3.09252;
  rb = 22.4802;
  rc = -0.482804;
  rd = 81.2778;

  ga = 3.26852;
  gb = -13.1746;
  gc = 15.7394;
  gd = 43.5159;

  ba = 5.25926;
  bb = -38.4087;
  bc = 58.2447;
  bd = 92.5794;

  x = map(x, a, b, 0, 5);

  return color(ra*x*x*x+rb*x*x+rc*x+rd, ga*x*x*x+gb*x*x+gc*x+gd, ba*x*x*x+bb*x*x+bc*x+bd);
}
