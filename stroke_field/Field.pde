public class Field
{
  int n;
  float w, h, s;
  float str, str_half;
  float scl;
  public Field(float w_, float h_, float s_)
  {
    w = w_;
    h = h_;
    s = s_;
    scl = 0.02;
    str = 20;
    str_half = str*0.5;
    n = (int)(w/s) * (int)(h/s);
  }
  public void show()
  {
    float x, y;
    stroke(11);
    for (x=0; x<w; x+=s) {
      for (y=0; y<h; y+=s) {
        PVector field = get_field(x, y);
        line(x, y, x+field.x, y+field.y);
      }
    }
  }
  public PVector get_field(float x, float y)
  {
    return new PVector(noise(x*scl, y*scl)*str-str_half, noise(y*scl, x*scl)*str-str_half);
  }
}
