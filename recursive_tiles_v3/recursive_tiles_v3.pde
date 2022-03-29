
Engine engine;
int sides;
int rad;
static int blocksize = 5;
void setup() {
  size(800, 640);
  rad = 5;
  sides = 6;
  engine = new Engine(sides, rad, 2*rad);
}

void draw() {
  engine.run();
  //saveFrame("output/frame-####.png");
  //if(frameCount > 330) exit();
}

void mouseReleased() {
  engine.clickEvent(mouseX, mouseY);
}

void keyPressed() {
  engine.clickEvent(width/2, height/2);
}
