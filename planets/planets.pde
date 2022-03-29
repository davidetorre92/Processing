Planet p;
void setup(){
  size(500, 500);
  p = new Planet(50, 0.003);
}

void draw(){
  background(244);
  translate(width/2, height/2);
  p.show();
  p.update();
}
