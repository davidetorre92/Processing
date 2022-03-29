
Engine engine;
int sides;
int rad;
static int blocksize = 5;
void setup() {
  size(1144, 1600);
  rad = 3;
  sides = 6;
  engine = new Engine(sides, rad, 2*rad);
}

void draw() {
  engine.run();
  saveFrame("output/frame-####.png");
  println(frameCount);
  if (frameCount > 330) exit();
}

void mouseReleased() {
  engine.clickEvent(mouseX, mouseY);
}

void keyPressed() {
  if (key == 'r') {
    for (int i=0; i<500; i++) {
      engine.clickEvent(int(random(0, width)), int(random(0, height)));
    }
  }
  if (key == 'a'){
    engine.clickEvent(width/2, height/2);
    engine.clickEvent(width/2+rad, height/2);
    engine.clickEvent(width/2-rad, height/2);
    engine.clickEvent(width/2+2*rad, height/2);
    engine.clickEvent(width/2-2*rad, height/2);
  }
}
