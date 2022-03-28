IntList seeds;
void setup()
{
  size(500, 500);
  seeds = new IntList();
  seeds.append(0);
}

void draw()
{
  background(188);
  for (int seed : seeds) {
    randomSeed(seed);
    int alpha = frameCount-seed;
    color c = sunset(2*seed, 0, width, alpha);
    noised(seed, c, 2*seed);
  }
  if(frameCount % 12 == 0 && frameCount < width) seeds.append(frameCount);
  saveFrame("instagram/frame-####.png");
  if(frameCount == 1100) exit();
}

void noised(int seed, color c, float y0)
{
  noStroke();
  randomSeed(seed);
  fill(c);
  float y = y0;
  beginShape();
  for (int x = 0; x < width; x++)
  {
    vertex(x, y);
    y+=(random(1)<0.5)?-1:1;
  }
  y = y0;
  vertex(width, y);
  for (int x = width; x > 0; x--)
  {
    vertex(x, y);
    y+=(random(1)<0.5)?-1:1;
  }


  endShape(CLOSE);
}

color sunset(float x, float a, float b, float alpha)
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

  return color(ra*x*x*x+rb*x*x+rc*x+rd, ga*x*x*x+gb*x*x+gc*x+gd, ba*x*x*x+bb*x*x+bc*x+bd, alpha);
}
