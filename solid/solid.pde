Solid s1;
Solid s2;
void setup()
{
  size(1500, 1500);
  s1 = new Solid(int(random(6,10)), 120, 120);
  s2 = new Solid(int(random(6,10)), 120, 120);
  s2.c = color(11,124,244);
}

void draw()
{
  float frac = 120.;
  background(216);
  s1.update(frac);
  s2.update(frac);
  s1.show();
  s2.show();
  if(frameCount/frac > 1) exit();
  saveFrame("instagram/frame-#####.png");
}
