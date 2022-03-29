float dmax = 20;
int n = 500;
color[] c =
{
color(62, 120, 178),
color(0, 75, 168),
color(74, 82, 90),
color(36, 39, 43),
color(7, 7, 10),
color(43, 43, 92),
};

void setup()
{
  size(1080, 1080);
  noLoop();
}

void draw()
{
  background(240);
  float[] pos = new float[n];
  for (int i = 0; i < n; i++)
  {
    pos[i] = i/(n+0.) * (width - 2 * dmax) + dmax;
  }
  for (int i = 0; i < n; i++)
  {
    int index = (int)(random(0,n));
    float temp = pos[index];
    pos[index] = pos[i];
    pos[i] = temp;
  }
  for (int i = 0; i < n; i++)
  {
    random_line(pos[i], random(height*0.04, height*0.06), random(height*0.92, height*0.94), c[(int)(random(c.length))], dmax, (int)(random(2, 8)));
  }
  saveFrame("instagra/frame.png");
}

void random_line(float x0, float y0, float l, color c, float dmax, int sW)
{
  int nseg = 1 + (int)(random(8, 16));
  float sum = 0.;
  float[] seg = new float[nseg];
  for (int i = 0; i < nseg; i++)
  {
    seg[i] = noise(sin(i/(nseg+0.)*TWO_PI)*0.02);
    sum += seg[i];
  }
  seg[0] /= sum;
  for (int i = 1; i < nseg; i++)
  {
    seg[i] /= sum;
    seg[i] += seg[i-1];
  }
  for (int i = 0; i < nseg; i++)
  {
    seg[i] *= l;
  }

  float x1 = x0 + shift(x0, dmax, y0, l);
  float y1 = seg[0];
  line_with_contourns(x0, y0, x1, y1, sW, 0, c);
  for (int i = 1; i < nseg - 1; i++)
  {
    x0 = x1;
    y0 = y1;
    x1 = x0 + shift(x0, dmax, y0, l);
    y1 = seg[i];
    line_with_contourns(x0, y0, x1, y1, sW, 1, c);
  }
  x0 = x1;
  y0 = y1;
  x1 = x0 + shift(x0, dmax, y0, l);
  y1 = seg[nseg-1];
  line_with_contourns(x0, y0, x1, y1, sW, 2, c);
}

float shift(float x0, float dmax, float y0, float l)
{
  float r;
  r = (x0-dmax < 0) ? noise(x0+sin(y0/l*TWO_PI)*0.002)*dmax : (x0+dmax > width) ? -noise(x0+sin(y0/l*TWO_PI)*0.002)*dmax : (noise(x0+sin(y0/l*TWO_PI)*0.002)*2-1)*dmax;
  return r;
}

void line_with_contourns(float x0, float y0, float x1, float y1, int sW, int mode, color c)
{
  float theta = atan2((y1-y0), (x1-x0));
  float l = dist(x0, y0, x1, y1);
  rectMode(CORNERS);
  stroke(c);
  pushMatrix();
  translate(x0, y0);
  rotate(theta);
  strokeWeight(sW);
  rect(0, 0, l, 0);
  strokeWeight(1);
  stroke(11);
  line(0, -sW*0.5, l, -sW*0.5);
  line(0, sW*0.5, l, sW*0.5);
  noFill();
  if (mode == 0) arc(0, 0, sW, sW, HALF_PI, 3*HALF_PI);
  if (mode == 2) arc(l, 0, sW, sW, 3*HALF_PI, 3*HALF_PI+PI);
  if (mode == 3)
  {
    arc(0, 0, sW, sW, HALF_PI, 3*HALF_PI);
    arc(l, 0, sW, sW, 3*HALF_PI, 3*HALF_PI+PI);
  }
  popMatrix();
  return;
}
