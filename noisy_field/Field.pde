public class Field
{
  private ArrayList<Vector> vectors;
  public Field(float x0, float y0, float x1, float y1, float dx, float dy)
  {
    float r_max = min(dx,dy) * 2;
    vectors = new ArrayList<Vector>();
    for(float x = x0; x <= x1; x += dx)
    {
      for(float y = y0; y <= y1; y += dy)
      {
         float rx = noise(x * 0.005, y * 0.005) * r_max;
         float ry = noise(y * 0.005, x * 0.005) * r_max * 0.66;
         float theta = noise(x * 0.005, y * 0.005) * TWO_PI;
         vectors.add(new Vector(x, y, rx, ry, theta));
      }
    }
  }
  public void show()
  {
    for(Vector v : vectors)
    {
      v.show(); 
    }
  }
}
