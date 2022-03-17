class Circle
{
  float x, y;
  float r;
  color c;
  float phi;
  final float dphi = 0.01;

  public Circle(float x_, float y_, float r_, color c_)
  {
    x = x_;
    y = y_;
    r = r_;
    c = c_;
    phi = random(HALF_PI);
  }

  public void show()
  {
    float dtheta = noise(phi)*2*0.05;
    fill(c);
    stroke(11);
    beginShape();
    for (float theta = 0; theta <=TWO_PI; theta += dtheta)
    {
      vertex(x + r(theta-HALF_PI)*cos(theta), y + r(theta-HALF_PI)*sin(theta));
    }
    endShape(CLOSE);
    update();
  }

  private float r(float t)
  {
    float noise = (cos(phi)+1)*0.25;
    return r*(1-noise + noise*noise(cos(t)*log(r)*0.5, sin(t+phi)*log(r)*0.5)*2);
    //float arg = r*cos(0.5*t);
    //float theta = 0.1/r;
    //float env = 0.5*exp(-arg*arg*theta);
    //return r *(1 + env*noise(0.25*r*cos(t+phi),0.25*r*sin(t+phi)));
  }

  private void update()
  {
    phi += dphi;
  }
}
