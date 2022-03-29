ArrayList<Shape> shapes;
float side;
void setup()
{
  size(1080, 1920); 
  shapes = new ArrayList<Shape>();
  side = 3*350;
  shapes.add(new Shape(width/2., height/2., width/2., height/2., 0, side));
}

void draw()
{
  ArrayList<Shape> new_shapes = new ArrayList<Shape>();
  background(208);
  for(Shape s : shapes)
  {
    s.show();
    s.update();
  }
  if(frameCount%60 == 0 && frameCount < 360){
    for(Shape s : shapes){
      for(Shape new_shape : s.grow()){
        new_shapes.add(new_shape);
      }
    }
    shapes = new_shapes;
}
  if(frameCount > 360){
    for(Shape s : shapes)
    {
      s.sidef = 0.; 
    }
  }
 saveFrame("tiktok_cantor</frame-#####.png");
 if(frameCount > 720) exit();
}
