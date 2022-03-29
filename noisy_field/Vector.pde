public class Vector
{
  float x, y, rx, ry, theta;
  color[] c =
  {
    #47a8a6,
    #6492ac,
    #637cb5,
    #6a63b6
  };
  public Vector(float _x, float _y, float _rx, float _ry, float _theta)
  {
    x = _x;
    y = _y;
    rx = _rx;
    ry = _ry;
    theta = _theta;
  }
  public void show()
  {
    noStroke();
    pushMatrix();
    translate(x,y);
    rotate(theta);
    fill(c[int(random(c.length))]);
    rect(0,0,rx,ry); 
    popMatrix();
  }
}
