ArrayList<LineGlow> lines;
void setup()
{
  size(500, 500);
  lines = new ArrayList<LineGlow>();
  for (float theta = 0.; theta <=TWO_PI; theta += TWO_PI/6.)
  {
    float xc, yc;
    xc = width/2;
    yc = height/2;
    lines.add(new LineGlow(xc + 200 * cos(theta), yc + 200 * sin(theta), xc + 200 * cos(theta + TWO_PI/6.), yc + 200 * sin(theta + TWO_PI/6.), 30));
  }
}

void draw()
{
  background(184);
  int TGlowFrames = 10;
  for (LineGlow l : lines)
  {
    l.show();
    l.glow(TGlowFrames);
  }
}
