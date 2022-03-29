class Solid{
  int n;
  float thr, mrg;
  color c;
  ArrayList<PVector> p0, p;
  Solid(int n_, float thr_, float mrg_){
    p0 = new ArrayList<PVector>();
    p = new ArrayList<PVector>();
    n = n_;
    thr = thr_;
    mrg = mrg_;
    c = color(244, 0, 0);
    for(int i = 0; i < n; i++)
    {
      boolean add = false;
      PVector pt = new PVector(0,0);
      while(!add){
        pt = new PVector(random(mrg, width-mrg), random(mrg, height-mrg));
        add = true;
        for(PVector t : p0)
        {
          if(PVector.dist(t, pt) < thr){
            add = false;
            break;
          }
        }
      }
      p0.add(pt);
    }
    for(PVector t : p0)
    {
      p.add(new PVector(t.x, t.y));      
    }
  }
  void show()
  {
    strokeWeight(3);
    stroke(c);
    for(PVector t1 : p)
    {
      for(PVector t2 : p)
      {
        line(t1.x,t1.y,t2.x,t2.y); 
      }
    }
  }
  void update(float frac)
  {
    for(int i = 0; i < n; i++)
    {
      p.get(i).x = p0.get(i).x + thr*noise(p0.get(i).x + cos(frameCount/frac * TWO_PI)*0.2);
      p.get(i).y = p0.get(i).y + thr*noise(p0.get(i).y + sin(frameCount/frac * TWO_PI)*0.2); 
    }
  }
}
