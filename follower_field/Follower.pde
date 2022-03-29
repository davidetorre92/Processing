public class Follower
{
  PVector[] pt;
  color str;
  float weight;
  float yshift;
  int n;
  float lerpval;
  float scl;
  Follower(float x, float y, float ys)
  {
    str = color(random(128, 244),0,0);
    n = 100;
    lerpval = 0.6;
    yshift = ys;
    weight = map(abs(yshift), 100, 0., 1., 5.);
    pt = new PVector[n];
    scl = 0.001;
    for (int i = 0; i < n; i++)
    {
      pt[i] = new PVector(x, y);
    }
  }
  void followMouse()
  {
    pt[0].x = lerp(pt[0].x, mouseX, lerpval);
    pt[0].y = lerp(pt[0].y, mouseY, lerpval);
    for (int i=1; i<n; i++)
    {
      pt[i].x = lerp(pt[i].x, pt[i-1].x, lerpval);
      pt[i].y = lerp(pt[i].y, pt[i-1].y, lerpval);
    }
  }
  void followField()
  {
    pt[0].x += 2*noise(pt[0].x*scl, pt[0].y*scl) - 1+3;
    pt[0].y += 2*noise(pt[0].y*scl, pt[0].x*scl) - 1;
    for (int i=1; i<n; i++)
    {
      pt[i].x = lerp(pt[i].x, pt[i-1].x, lerpval);
      pt[i].y = lerp(pt[i].y, pt[i-1].y, lerpval);
    }   
  }
  void show()
  {
    stroke(str);
    strokeWeight(weight);
    for (int i = 0; i < n-1; i++)
    {
      line(pt[i].x, pt[i].y+yshift, pt[i+1].x, pt[i+1].y+yshift);
    }
  }
}
