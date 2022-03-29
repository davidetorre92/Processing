class Bubble{
  public float x, y;
  public float r;
  public int id;
  public boolean active = true;
  public boolean passive = true;
  private final int sides = int(random(3,8));
  final private color[] colr_array = {color(#390099),
                                      color(#9e0059),
                                      color(#ff0054),
                                      color(#ff5400),
                                      color(#ffbd00)
                                      };
  final private color c = colr_array[int(random(colr_array.length))];
  final private float dr = 4;
  public Bubble(float x_, float y_, int id_, float r0)
  {
    x = x_;
    y = y_;
    id = id_;
    r = 2 * r0;
  }
  
  public void show()
  {
    noFill();
    stroke(c);
    strokeWeight(r*0.1);
    float dtheta = TWO_PI/sides;
    beginShape();
    for(float theta = 0; theta < TWO_PI; theta +=dtheta)
    {
      vertex(x + 0.5*r*cos(theta), y + 0.5*r*sin(theta));
    }
    endShape(CLOSE);
    //dtheta*=3;
    //strokeWeight(r*0.05);
    //for(float theta = 0; theta < TWO_PI; theta +=dtheta)
    //{
    //  line(x, y, x + 0.5*r*cos(theta), y + 0.5*r*sin(theta));
    //}
  }
  
  public void update()
  {
    r+=dr;
  }
}
