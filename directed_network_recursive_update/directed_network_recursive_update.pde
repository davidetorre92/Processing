Network n;
Updater u;
int time = 0;
boolean phaseOne;
void setup()
{
  size(500, 500);
  n = new Network(true);
  u = new Updater();
  phaseOne = true;
  strokeWeight(0.5);
}

void draw()
{
  background(11);
  n.show();
  n.move();
  time++;
  if (frameCount > 75 * 7 && phaseOne)
  {
    phaseOne = false;
    for (Vertex v : n.verteces)
    {
      v.r_end.x = width*0.5;
      v.r_end.y = height*0.5;
      v.lerpVal = 0.2;
    }
  }
  if (time == 75 && phaseOne)
  {
    time = 0;
    n = u.update(n);
  }
  if (frameCount > 75 * 8)
  {
    exit();
  }
}
