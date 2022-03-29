Blockmap b;
int rows, cols;
Thing t;
void setup() {
  size(500, 500);
  rows = 10;
  cols = 10;
  t = new Thing();
  b = new Blockmap(rows, cols, t);
}

void draw() {
  background(11);
  t.update();
  b.update(t);
  b.show();
  t.show();
}
