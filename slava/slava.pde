Barley b;
void setup()
{
  size(500, 500);
  b = new Barley(width/2, height/2, 50);
}

void draw()
{
  background(192);
  b.show();
  b.update();
}
