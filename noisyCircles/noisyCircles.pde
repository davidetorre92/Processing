Engine e;
int n;

void setup(){
  size(500, 500);
  n = 20;
  e = new Engine(n);
}

void draw(){
  e.run();
  saveFrame("output/frame-####.png");
  if(frameCount>=450) exit();
}
