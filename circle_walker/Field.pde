class Field{

  public float scale;
  public float max_int;
  public float z = 0;
  final private float dx = 10.;
  final private float dy = 10.;
  
  public Field(float scale_, float max_int_){
    scale = scale_;
    max_int = max_int_;
  }
  
  public PVector field(float x, float y)
  {
    float theta = 2 * TWO_PI * noise(x,y,z);
    float r = max_int * noise(x,y,z);
    r = 0;
    return new PVector(r * cos(theta) + max_int * 0.1 * (x - width/2) ,
                        r * sin(theta) + max_int * 0.1 * (y - height/2)
    );
  }
  
  public void show()
  {
    stroke(11);
    fill(11);
    for(float x = 0; x < width; x += dx)
    {
      for(float y = 0; y < height; y += dy)
      {
        PVector f = field(x, y);
        line(x, y, x + f.x, y + f.y);
        ellipse(x + f.x, y + f.y, 3, 3);
      }
    }
  } 
}
