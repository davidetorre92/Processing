Network network;

void setup(){
  size(500, 500);
  network = new Network(250, 0, 200);
}

void draw()
{
  background(184); 
  network.show();
  network.grow();
}
