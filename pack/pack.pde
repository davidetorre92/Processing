ArrayList<CirclePack> circles;
int n = 250;
boolean drawIt = false;
int frameN = 0;
color[] cc = {
  color(11, 31, 17),
  color(6, 59, 23),
  color(8, 252, 85),
  color(44, 212, 97),
  color(90, 184, 120)

};

void setup()
{
  size(1080, 1080);
  circles = new ArrayList<CirclePack>();
  for (int i = 0; i < n; i++)
  {
    float r = random(min(width, height) * 0.5 * 0.8);
    float theta = random(TWO_PI);
    float diam = random(2, 10);
    int ind = (int)random(cc.length);
    CirclePack newC = new CirclePack(r*cos(theta) + width*0.5, r*sin(theta) + height*0.5, diam, cc[ind]);
    if (newC.amIUpdatable(circles)) circles.add(newC);
    else i--;
    println(i, "/", n);
  }
}

void draw()
{
  background(244);
  for (CirclePack c : circles)
  {
    c.show();
    c.update(circles);
  }
  drawIt = true;
  for (CirclePack c : circles)
  {
    if (c._updateable)
    {
      drawIt = false;
      break;
    }
  }
  if (drawIt && frameN < 180)
  {
    frameN = frameN+1;
    saveFrame("instagram/white/frame-####.png");
  }
  if (frameN == 180) exit();
  println(frameN);
}
