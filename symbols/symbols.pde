Shape s;

void setup()
{
  size(500, 500); 
  s = new Shape(width/2,height/2,100, "triangle");
}

void draw()
{
  background(244);
  s.show(); 
}
