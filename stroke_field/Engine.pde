public class Engine
{
  float delta_t;
  Engine(float delta_t_)
  {
     delta_t = delta_t_; 
  }
  public void run(Ball b, Field f)
  {
    PVector force = f.get_field(b.x, b.y);
    b.vx += force.x * delta_t;
    b.vy += force.y * delta_t;
    b.x += b.vx * delta_t;
    b.y += b.vy * delta_t;
    
  }
}
