public class HeatGenerator {
  public float x, y, L, T;
  public HeatGenerator(float x_, float y_, float T_)
  {
    x = x_;
    y = y_;
    T = T_;
    L = width/3.;
  }
  public void show()
  {
    fill(244);
    ellipse(x, y, 3, 3);
  }
  public void generateBall(ArrayList<FireBall> balls)
  {
    float xBall = random(x-L*0.5,x+L*0.5);
    float yBall = random(y-L*0.05,y+L*0.05);
    balls.add(new FireBall(xBall,yBall,T)); 
  }
  
}
