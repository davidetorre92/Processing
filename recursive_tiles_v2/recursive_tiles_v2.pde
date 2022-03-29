
Engine engine;
int sides;
int rad;
void setup() {
  size(500, 500);
  rad = 4;
  sides = 6;
  engine = new Engine(sides, rad, 2*rad);
}

void draw() {
  engine.run();
}

void mouseReleased() {
  engine.clickEvent(mouseX, mouseY);
}

void keyPressed() {
  engine.clickEvent(width/2, height/2);
}
