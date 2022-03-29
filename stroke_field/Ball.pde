public class Ball
{
  float x, y;
  float vx, vy;
  float r;
  float delta_t, T, t;
  float amp;
  color c;
  Ball(float xstart, float ystart, float delta_t_)
  {
    x = xstart;
    y = ystart;
    vx = 0;
    vy = 0;
    delta_t = delta_t_;
    T = TWO_PI;
    amp = 10;
    r = 0;
    t = get_phase(r, amp);
    c = pal();
  }
  private float get_phase(float r, float amp)
  {
    float phi = asin(r/amp);
    return phi;
  }
  public void show()
  {
    noStroke();
    fill(c);
    ellipse(x, y, 2*r, 2*r);
  }
  public void update()
  {
    t+=delta_t;
    r = amp*sin(t/T);
    r = max(r, 0);
  }
  private color pal()
  {
    color[] palette = new color[10];
    palette[0] = color(217, 237, 146);
    palette[1] = color(181, 228, 140);
    palette[2] = color(153, 217, 140);
    palette[3] = color(118, 200, 147);
    palette[4] = color(82, 182, 154);
    palette[5] = color(52, 160, 164);
    palette[6] = color(22, 138, 173);
    palette[7] = color(26, 117, 159);
    palette[8] = color(30, 96, 145);
    palette[9] = color(24, 78, 119);
    int i = (int)(random(10));
    return palette[i];
  }
}
