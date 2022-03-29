class Particle {
  PVector pos0, pos;
  float t, T;
  private final float r = 12;
  private final int phase = (int)(random(120));
  public Particle(float x0, float y0, float T_)
  {
    pos0 = new PVector(x0, y0);
    pos = new PVector(x0, y0);
    T = T_;
    t = phase;
    plasma();
  }

  public void show()
  {
    noStroke();
    fill(plasma());
    ellipse(pos.x, pos.y, r, r);
  }

  public void update()
  {
    if (t % T == 0)
    {
      t = 0;
    }
    float arg = t*TWO_PI/T;
    pos.x = pos0.x + 50 * (noise(pos0.x + cos(arg), pos0.y + sin(arg)) - 0.5);
    pos.y = pos0.y + 50 * (noise(pos0.y + sin(arg), pos0.x + cos(arg)) - 0.5);
    t++;
  }
  private float get_alpha(float t)
  {
    float t_mi = t - T/2;
    t_mi /= T*0.4;
    return 244 * exp(-t_mi*t_mi)*exp(-t_mi*t_mi);
  }

  private color plasma() {
    float red, green, blue;
    float ar = -1.11111;
    float br = 6.75;
    float cr = 43.3611;
    float dr = -1;

    float ag = 0.997475;
    float bg = -7.6461;
    float cg = 19.5556;
    float dg = 62.9848;

    float ab = -0.111111;
    float bb = -6.79761;
    float cb = 40.0754;
    float db = 91.8333;

    float x = dist(pos.x, pos.y, width/2, height/2);
    x = map(x, 0, width/2, 8, 3);
    red   = ar*x*x*x+br*x*x+cr*x+dr;
    green = ag*x*x*x+bg*x*x+cg*x+dg;
    blue  = ab*x*x*x+bb*x*x+cb*x+db;
    return color(red, green, blue, get_alpha(t));
  }
}
