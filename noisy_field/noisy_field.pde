Field field;

void setup()
{
  size(1000, 1000); 
  noLoop();
  field = new Field(40, 40, 960, 960, 15, 15);
  background(232);
}

void draw()
{
  field.show();
  saveFrame("instagram/gwyneth_quantum_self_healing_vagina.png");
  exit();
}
