class Circles {
  ArrayList<Circle> circles;
  Circles(Grid grid, float dtheta)
  {
    circles = new ArrayList<Circle>();
    for (PVector c : grid.centers)
    {
      int n = (int)(random(2, 8));
      circles.add(new Circle(0, dtheta*n, c, grid.ds*0.98, dtheta));
    }
  }
  void show()
  {
    for (Circle c : circles)
    {
      c.show();
    }
  }
  void update()
  {
    for (Circle c : circles)
    {
      c.update();
    }
    
  }
}
