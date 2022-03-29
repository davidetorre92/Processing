public class Engine
{
  private ArrayList<HeatGenerator> heaters;
  private ArrayList<FireBall> balls;
  private int randT;
  private final float constrain_top = 256;
  private int totCol = 16;
  
  public Engine(ArrayList<HeatGenerator> h_, ArrayList<FireBall> b_)
  {
    heaters = h_;
    balls = b_;
    randT = 2;
  }
  public void run()
  {
    fill(11);
    rect(0,0,width,height);
    if (frameCount % randT == 0) {
      randT = get_randT();
      for (HeatGenerator h : heaters) {
        int newBalls = (int)(random(10, 20));
        for (int b = 0; b < newBalls; b++) h.generateBall(balls);
      }
    }
    IntList removeBalls = new IntList();
    for (int iball = 0; iball<balls.size(); iball++)
    {
      FireBall b = balls.get(iball);
      b.drift();
      b.update(balls, iball);
      if (b.y<0) removeBalls.append(iball);
      if (b.T<b.freeze_thr) removeBalls.append(iball);
    }
    for (int b=0; b<removeBalls.size(); b++)
    {
      balls.remove(removeBalls.get(b)-b);
    }
    get_pixels();
  }
  private int get_randT()
  {
    return (int)(random(10, 15));
  }
  private void get_pixels()
  {
    loadPixels();
    int x, y;
    for (y = 0; y < height; y++)
    {
      for (x = 0; x < width; x++)
      {
        float V, Vap, d;
        V = 0;
        for (FireBall b : balls) {
          d = dist(x, y, b.x, b.y);
          Vap = b.T*0.5/d - b.T/(height - y);
          V += constrain(Vap, 0, constrain_top);
        }
        pixels[x + y * width] = get_color(V);
      }
    }
    updatePixels();
  }
  private color get_color(float V)
  {
    
    return color(V*V,V,0);
  }
}
