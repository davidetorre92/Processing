int nback = 100;
int ncirc = 400;
float r;
void setup()
{
  size(1080, 1080);
  r = width/3;
  strokeWeight(1);
  stroke(11);
  frameRate(10);
}

void draw()
{
  background(236);
  randomSeed(12345);
  stroke(11,128);
  for (int i = 0; i < nback; i++)
  {
    float x0, x1, y0, y1;
    if (random(1) < 0.5)
    {
      x0 = random(0,width);
      x1 = random(0,width);
      y0 = 0;
      y1 = height;
    } else {
      x0 = 0;
      x1 = width;
      y0 = random(0,height);
      y1 = random(0,height);

    }
    line(x0, y0, x1, y1);
  }
  stroke(11);
  randomSeed(frameCount);
  for (int i = 0; i < ncirc; i++)
  {
    float theta0, theta1;
    float x0, y0, x1, y1;
    theta0 = random(0, TWO_PI);
    theta1 = random(0, TWO_PI);
    x0 = width/2 + r*cos(theta0);
    y0 = height/2 + r*sin(theta0);
    x1 = width/2 + r*cos(theta1);
    y1 = height/2 + r*sin(theta1);
    line(x0, y0, x1, y1);
  }
  saveFrame("instagram/frame-####.png");
  if(frameCount > 100) exit();
}
