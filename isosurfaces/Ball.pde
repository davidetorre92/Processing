public class Ball {
  public float x0, y0, x, y, ns_dtheta;
  private float ns_theta, ns_amp;
  public float r;
  public Ball(float r_, float ns_dtheta_) {
    ns_theta = random(TWO_PI);
    x0 = width/2.+random(-width*0.1,width*0.1);
    y0 = height/2.+random(-height*0.1,height*0.1);
    r = r_;
    ns_amp = 100;
    x = x0;
    y = y0;
    ns_dtheta = ns_dtheta_;
  } 

  public void update() {
    ns_theta += ns_dtheta;
    x = x0 + ns_amp*(cos(ns_theta)+2*noise(cos(ns_theta))-1);
    y = y0 + ns_amp*(sin(ns_theta)+2*noise(sin(ns_theta))-1);
  }
}
