Sky s;

void setup()
{
  int frames_per_day = 200;
  size(500, 500); 
  s = new Sky(frames_per_day, 30);
}

void draw()
{
  s.show(frameCount); 
}
