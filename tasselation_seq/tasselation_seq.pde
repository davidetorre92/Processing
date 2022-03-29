TasPlane p;
void setup()
{
  size(1500, 1500);
  int marginX = 90;
  int marginY = 90;
  float tasSize = 60;
  p = new TasPlane(marginX, marginY, width - marginX, height - marginY, tasSize);
}

void draw()
{
  int frameStop = 120;
  background(200);
  p.show(frameStop);
  saveFrame("instagram/frame-#####.png");
  if(frameCount > frameStop) exit();
}
