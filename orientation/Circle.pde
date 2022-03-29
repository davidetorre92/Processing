class Circle {
  float theta1, theta2;
  PVector c;
  color clr;
  float phase0, phase;
  float r;
  Circle(float theta1_, float theta2_, PVector c_, float r_, float dtheta) {
    theta1 = theta1_;
    theta2 = theta2_;
    r = r_;
    c = new PVector(c_.x, c_.y);
    phase = phase0 = int(noise(c.x*0.01+c.y*0.01)*10)*dtheta;
    clr = viridis(noise(c.x*0.2, c.y*0.2), 0, 1);
  }
  void show()
  {
    noStroke();
    fill(clr);
    pushMatrix();
    translate(c.x, c.y);
    rotate(phase);
    arc(0, 0, r, r, theta1, theta2);
    popMatrix();
  }
  void update(){
    float frames = 360.;
    if(frameCount/frames >= 1) exit();
    phase = phase0 + TWO_PI * noise(c.x + cos(frameCount/frames * TWO_PI), c.y + sin(frameCount/frames * TWO_PI));
  }
}

  private color viridis(float x, float a, float b){
    float red, green, blue;
    float ar = 0.888306;
    float br = -5.63986;
    float cr = -0.0922688;
    float dr = 72.7692;
    
    float ag = -0.0501166;
    float bg = -0.747669;
    float cg = 36.3502;
    float dg = 2.68112;

    float ab = 0.287685;
    float bb = -7.96329;
    float cb = 42.3236;
    float db = 83.5413;

    x = map(x,a,b,0,10);
    red   = ar*x*x*x+br*x*x+cr*x+dr;
    green = ag*x*x*x+bg*x*x+cg*x+dg;
    blue  = ab*x*x*x+bb*x*x+cb*x+db;
    return color(red, green, blue);
  }  
