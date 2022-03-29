public class TasPlane
{
  public float x0, y0, x1, y1;
  public float tasSize;
  public int mode = 0;
  private ArrayList<PVector> centers;
  public TasPlane(float x0_, float y0_, float x1_, float y1_, float s)
  {
    x0 = x0_;
    y0 = y0_;
    x1 = x1_;
    y1 = y1_;
    tasSize = s;
    centers = new ArrayList<PVector>();
    init();
  }
  public void show(float T)
  {
    noStroke();
    int n = centers.size();
    for (int i = 0; i < n; i++)
    {
      PVector c = centers.get(i);
      float dx = (x1 - x0) * 0.5 - c.x + tasSize;
      float dy = (y1 - y0) * 0.5 - c.y + tasSize;
      float val = (sin((sqrt(dx*dx+dy*dy)-frameCount)/T*TWO_PI) + 1);
      fill(viridis(val, 0.0, 2));
      ellipse(c.x, c.y, tasSize, tasSize);
    }
  }
  private void init()
  {
    ArrayList<PVector> queue = new ArrayList<PVector>();
    if (mode == 0) //SQUARES
    {
      queue.add(new PVector(x0 + tasSize * 0.5, y0 + tasSize * 0.5));
      put_rec(queue, HALF_PI);
    }
    if (mode == 1) //HEX
    {
      queue.add(new PVector(x0 + tasSize * 0.5, y0 + tasSize * 0.5));
      put_rec(queue, TWO_PI/6.);
    }
  }
  private void put_rec(ArrayList<PVector> queue, float angle)
  {
    if (queue.size() == 0) return;
    float x = queue.get(0).x;
    float y = queue.get(0).y;
    if (x < x0 || x > x1 || y < y0 || y > y1) {
      queue.remove(0);
      put_rec(queue, angle);
      return;
    }
    for (PVector c : centers)
    {
      if (dist(c.x, c.y, x, y) < tasSize) {
        queue.remove(0);
        put_rec(queue, angle);
        return;
      }
    }
    centers.add(new PVector(x, y));
    queue.remove(0);
    for (float theta = 0.; theta <TWO_PI; theta +=angle)
    {
      queue.add(new PVector(x + tasSize*cos(theta), y + tasSize*sin(theta)));
    }
    put_rec(queue, angle);
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
