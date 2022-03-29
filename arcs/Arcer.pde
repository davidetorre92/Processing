class Arcer {
  float x, y;
  float arc_lenght;
  float r;
  color c;
  int frames;
  Arcer(float x_, float y_, float arc_lenght_, float r_, int frames_) {
    x = x_;
    y = y_;
    arc_lenght = arc_lenght_;
    r = r_;
    c = viridis(noise(x*0.02, y*0.02),0.3,0.8);
    frames = frames_;
  }

  void show()
  {
    noFill();
    pushMatrix();
    translate(x, y);
    stroke(c);
    strokeWeight(noise(cos(frameCount/(frames+0.)*TWO_PI) + x*0.02, sin(frameCount/(frames+0.)*TWO_PI) + y*0.02) * 15);
    for (float theta = 0; theta < TWO_PI; theta+=arc_lenght)
    {
      float rnd = noise(x * 0.02 + theta * 0.2, y * 0.02 + theta * 0.2);
      if (rnd < 1/3.)
      {
        arc(0, 0, 2*r, 2*r, theta, theta+arc_lenght);
      } else if (rnd >= 1/3.+0.02) {
        float xt, yt;
        xt = 2 * r * cos(theta + arc_lenght*0.5)*abs(cos(theta + arc_lenght*0.5));
        yt = 2 * r * sin(theta + arc_lenght*0.5)*abs(sin(theta + arc_lenght*0.5));
        translate(xt, yt);
        arc(0, 0, 2*r, 2*r, theta + PI, theta + arc_lenght + PI);
        translate(-xt, -yt);
      }
    }
    popMatrix();
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
}
