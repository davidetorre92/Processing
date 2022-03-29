Field f;
Ball b[];
Engine e;
int nballs;
float t, delta_t;
void setup()
{
  float spacing = 10.;
  delta_t = 0.01;
  nballs = 3000;
  b = new Ball[nballs];
  size(900, 1600);
  noiseSeed(12345);
  f = new Field(width, height, spacing);
  for (int i = 0; i < nballs; i++)
  {
    b[i] = new Ball(random(width), random(height), delta_t);
  }
  e = new Engine(delta_t);
  t = 0;
  background(0);
}

void draw()
{
  fill(11, 11);
  rect(0, 0, width, height);
  for (int i = 0; i < nballs; i++)
  {
    b[i].show();
    e.run(b[i], f);
    b[i].update();
  }
  t += delta_t;
  saveFrame("tiktok/frame-######.png");
  if (b[0].t/b[0].T > 2.5*HALF_PI) exit();
}
