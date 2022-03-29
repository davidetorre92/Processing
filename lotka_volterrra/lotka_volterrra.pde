Cell[] cells;
int h, w;
int n;

void setup() {
  size(500, 500);
  h = 20;
  w = 20;
  initiate();
  frameRate(1);
}

void draw() {
  background(244);
  showGrid();
  evolveTheSystem();
}

void initiate() {
  n = width*height/(h*w);
  cells = new Cell[n];
  int i = 0;
  for (int x = 0; x < width; x += w) {
    for (int y = 0; y < height; y += h) {
      cells[i] = new Cell(x, y, w, h, i);
      i++;
    }
  }
  stroke(11);
}

void showGrid() {
  for (int i = 0; i < n; i++) {
    cells[i].show();
  }
}

void evolveTheSystem() {
  for (int i = 0; i < n; i++) {
    cells[i].update();
  }
}
