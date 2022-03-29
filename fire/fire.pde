ArrayList<HeatGenerator> heaters;
ArrayList<FireBall> balls;
Engine e;
void setup()
{
  size(500, 500);
  
  //Physical data: temperature
  float T = 300;
  heaters = new ArrayList<HeatGenerator>();
  balls = new ArrayList<FireBall>();
  heaters.add(new HeatGenerator(width/2, height*0.75, T));
  e = new Engine(heaters, balls);
}

void draw()
{
  e.run();
  saveFrame("instagram/frame-######.png");
    if (frameCount > 300)
  {
    exit();
  }

}
