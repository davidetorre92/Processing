public class FireBall {
  public float x, y, T, tau, alpha;
  private final int freeze_thr = 20;
  public FireBall(float x_, float y_, float T_)
  {
    x = x_;
    y = y_;
    T = T_;
    tau = random(0.001, 0.08);
  }
  public void drift()
  {
    x +=random(0, 2) - 1;
    y -= (height-y)*0.01;
  }
  public void update(ArrayList<FireBall> balls, int id)
  {
    T -= tau*T;
  }
}
