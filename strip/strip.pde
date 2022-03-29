ArrayList<Strip> strips;
void setup()
{
  size(1500, 1500);
  float ds = 150;
  float margin = 150;
  ArrayList<PVector> centers = new ArrayList<PVector>();
  for(float x = margin + ds*0.5; x < width-margin; x += ds)
  {
    for(float y = margin + ds*0.5; y < height-margin; y += ds)
    {
      centers.add(new PVector(x,y));
    }
  }
  strips = new ArrayList<Strip>();
  for(PVector c : centers)
  {
      strips.add(new Strip(c.x, c.y, ds*0.5*0.75, 2*int(random(1,4))));
      println(c.x, c.y);
  }
}

void draw()
{
  background(204);
  for(Strip s : strips)
  {
    s.show();
  }
  if(frameCount > strips.get(0).frameStop) exit();
  saveFrame("instagram/frame-#####.png");
}
