class Grid {
  ArrayList<PVector> centers;
  int mrg;
  int ds;
  Grid(int mrg_, int ds_)
  {
    mrg = mrg_;
    ds = ds_;
    centers = new ArrayList<PVector>();
    int side = min(width, height);
    for (float x = mrg; x <=side-mrg; x+=ds)
    {
      for (float y = mrg; y <=side-mrg; y+=ds)
      {
        centers.add(new PVector(x + ds*0.5, y + ds*0.5));
      }
    }
  }
  void show()
  {
    fill(11);
    noStroke();
    for(PVector c : centers)
    {
       ellipse(c.x, c.y, 6, 6); 
    }
  }
}
