import processing.svg.*;

Engine engine;
int sides;
int rad;
static int blocksize = 5;
static int fallVal = 6;
static int initVal = 10;
void setup() {
  size(1144, 1600);
  rad = 36;
  sides = 6;
  engine = new Engine(sides, rad, 2*rad);
  for(int i = 0; i < 500; i++){
    engine.clickEvent((int)(random(width)), (int)(random(height)));
  }
}

void draw() {
  engine.run();
  println(frameCount);
  if(frameCount==300){saveFrame("copertina/animation-######.png"); exit();}
}

void mouseReleased() {
  engine.clickEvent(mouseX, mouseY);
}

void keyPressed() {
  if(key =='s') saveFrame("output/frame-####.png");
}
