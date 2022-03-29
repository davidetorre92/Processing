Field f;
ArrayList<Particle> particles;
int frameStop;
int NPart;
void setup()
{
  size(1500, 1500);
  f = new Field(1, 5);
  particles = new ArrayList<Particle>();
  NPart = 2000;
  frameStop = 120;
  for (int n = 0; n < NPart; n++)
  {
    float r = sqrt(random(0, width/2) * random(0, width/2));
    float theta = random(2 * TWO_PI);
    particles.add(new Particle(r * cos(theta) + width/2,
      r * sin(theta) + height/2,
      frameStop));
  }
}

void draw()
{
  background(196);
  fill(244, 0, 0);
  for (Particle p : particles)
  {
    p.show();
    p.update();
  }
  saveFrame("instagram/frame-#####.png");
  if (frameCount > frameStop) exit();
}
