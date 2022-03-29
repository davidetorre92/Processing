Grid grid;
Circles circles;
void setup()
{
  size(500, 500);
  grid = new Grid(30, 10);
  circles = new Circles(grid, HALF_PI*0.5);
}

void draw()
{
  background(220);
  circles.show();
  circles.update();
  //saveFrame("instagram/frame-#####.png");
}
