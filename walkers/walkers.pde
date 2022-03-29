PVector[] point_t;
PVector[] point_t_1;
int n;
float v;
float r;
float r_inf;
float t = 0;
float[] r_i;
int tf;
void setup()
{
  size(1500, 1500);
  n = 500;
  v = 0.01;
  point_t = new PVector[n];
  point_t_1 = new PVector[n];
  tf = (int)(random(5, 30));
  r_i = new float[tf];
  r_i[0] = 0.;
  for (int i = 1; i < tf; i++)
  {
    r_i[i] = 180/i;
  }
  for (int i = 0; i < n; i++)
  {
    point_t[i] = new PVector(0, 0);
    point_t_1[i] = new PVector(0, 0);
  }

  r = 10;
  for (int it = 0; it < n; it++) {
    point_t[0].x = 0;
    point_t[0].y = 0;
    for (int i = 0; i < tf; i++)
    {
      point_t[0].x += r_i[i]*cos(t*i);
      point_t[0].y += r_i[i]*sin(t*i);
    }
    t += v;
    for (int i = 1; i < n; i++)
    {
      point_t[i].x = point_t_1[i-1].x;
      point_t[i].y = point_t_1[i-1].y;
    }
    for (int i = 0; i < n; i++)
    {
      point_t_1[i].x = point_t[i].x;
      point_t_1[i].y = point_t[i].y;
    }
  }
}

void draw()
{
  background(220);
  noStroke();
  translate(width/2, height/2);

  for (int i = 0; i < n; i++)
  {
    float s = 1. - i/(n+0.);
    fill(35, 0, 0, 244 * s);
    ellipse(point_t[i].x, point_t[i].y, r*s, r*s);
  }
  point_t[0].x = 0;
  point_t[0].y = 0;
  for (int i = 0; i < tf; i++)
  {
    point_t[0].x += r_i[i]*cos(t*i);
    point_t[0].y += r_i[i]*sin(t*i);
  }
  t += v;
  for (int i = 1; i < n; i++)
  {
    point_t[i].x = point_t_1[i-1].x;
    point_t[i].y = point_t_1[i-1].y;
  }
  for (int i = 0; i < n; i++)
  {
    point_t_1[i].x = point_t[i].x;
    point_t_1[i].y = point_t[i].y;
  }
  saveFrame("instagram/frame-####.png");
  if ((t - n * v) > TWO_PI) exit();
}
