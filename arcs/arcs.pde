ArrayList<Arcer> arcs;
Grid grid;
int frames = 300;
void setup()
{
  grid = new Grid(150, 150);
  arcs = new ArrayList<Arcer>();
  for(PVector r : grid.centers)
  {
    arcs.add(new Arcer(r.x, r.y, HALF_PI, 75, frames));
  }
  size(1500, 1500);
  
}

void draw()
{
  background(212);
  for(Arcer a : arcs)
  {
    a.show(); 
  }
  saveFrame("instagram/frame-#####.png");
  if(frameCount > frames) exit();
}
