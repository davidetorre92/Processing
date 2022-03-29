public class Vertex
{
  PVector r;
  final PVector r_end;
  float diam;
  float lerpVal;
  Vertex(float x, float y, float x_e, float y_e)
  {
    diam = 1;
    lerpVal = 0.05;
    r = new PVector(x, y);
    r_end = new PVector(x_e, y_e);
  }
  public void show()
  {
    noStroke();
    fill(1);
    ellipse(r.x, r.y, diam, diam); 
  }
  public void update()
  {
    r.x = lerp(r.x, r_end.x, lerpVal);
    r.y = lerp(r.y, r_end.y, lerpVal);
  }
}
