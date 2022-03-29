public class Shape
{
  public float x, y;
  public float r;
  public float theta;
  public PShape shape;

  public Shape(float _x, float _y, float _r, String cmd)
  {
    x = _x;
    y = _y;
    r = _r;
    theta = 0;
    shape = construct(cmd);
}

  private PShape construct(String cmd)
  {
    PShape dummy_shape = createShape();
    switch(cmd) {
    case "line":
      dummy_shape = line_shape();
      break;
    case "triangle":
      dummy_shape = triangular_shape();
      break;
    default:
      println("Unknown type: " + cmd + ". Aborting...");
      exit();
    }
    return dummy_shape;
  }

  public void show()
  {
    pushMatrix();
    translate(x, y);
    rotate(theta);
    shape(shape, 0, 0);
    popMatrix();
  }

  private PShape line_shape()
  {
    PShape dummy = createShape();
    dummy.beginShape();
    dummy.stroke(244, 0, 0);
    dummy.strokeWeight(r*0.2);
    dummy.vertex(-r, 0);
    dummy.vertex(r, 0);
    dummy.endShape();
    return dummy;
  }

  private PShape triangular_shape()
  {
    PShape dummy = createShape();
    dummy.beginShape();
    dummy.stroke(244, 244, 0);
    dummy.noFill();
    dummy.strokeWeight(r*0.2);
    for(int corner = 0; corner < 3; corner++)
    {
      float ang = TWO_PI/3.*corner - HALF_PI;
      dummy.vertex(r*cos(ang), r*sin(ang)); 
    }
    
    dummy.endShape(CLOSE);
    return dummy;
  }
  
}
