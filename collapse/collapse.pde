PVector[] points;
PVector[] points_end;
PVector start, end;
int n;
float r;

void setup()
{
  size(1500, 1500);
  n = 100;
  points = new PVector[n+2];
  points_end = new PVector[n+2];
  float dtheta = TWO_PI/n;
  r = 600;
  for (int i = 1; i <= n; i++)
  {
    float theta = (i-1) * dtheta;
    points[i] = new PVector(r * cos(theta), r * sin(theta));
    points_end[i] = new PVector(r * cos(theta), r * sin(theta));
  }
    points[0] = new PVector(r * cos(0), r * sin(0));
    points_end[0] = new PVector(r * cos(0), r * sin(0));
    points[n+1] = new PVector(r * cos(TWO_PI), r * sin(TWO_PI));
    points_end[n+1] = new PVector(r * cos(TWO_PI), r * sin(TWO_PI));

}

void draw()
{
  int frameAnim1 = 300;
  float xc, yc;
  float f_t = sin(frameCount*PI/frameAnim1);
  xc = width*0.5;
  yc = height*0.5;
  beginShape();
  noFill();
  stroke(0,128*f_t,244*f_t);
  strokeWeight(3);
  curveVertex(points[0].x, points[0].y);
  background(200);
  for (int i = 1; i < n; i++)
  {
    curveVertex(points[i].x, points[i].y);
    points[i].x = points_end[i].x + f_t*r*(2*noise(cos((frameCount * TWO_PI)/frameAnim1)+points_end[i].x)-1)+xc;
    points[i].y = points_end[i].y + f_t*r*(2*noise(sin((frameCount * TWO_PI)/frameAnim1)+points_end[i].y)-1)+yc;
  }
  curveVertex(points[n].x, points[n].y);
  endShape(CLOSE);
  saveFrame("instagram_2/frame-#####.png");
  if (frameCount == frameAnim1) exit();
}

void update_points_end()
{
  float phase = random(0, HALF_PI*0.25);
  float dtheta = TWO_PI/n;
  float xc, yc;
  xc = width*0.5;
  yc = height*0.5;
  for (int i = 1; i <= n; i++)
  {
    float theta = (i-1) * dtheta;
    points_end[i].x = r * cos(theta + phase) + xc;
    points_end[i].y = r * sin(theta + phase) + yc;
  }
    points_end[0].x = r * cos(phase) + xc;
    points_end[0].y = r * sin(phase) + yc;
    points_end[n+1].x = r * cos(phase) + xc;
    points_end[n+1].y = r * sin(phase) + yc;
}
