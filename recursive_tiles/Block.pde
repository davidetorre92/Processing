class Block {
  IntList tiles;
  int x, y;
  int side;
  int uid;
  Block(int x_, int y_, int side_) {
    x = x_;
    y = y_;
    side = side_;
    tiles = new IntList();
  }
  void show() {
    stroke(11, 128);
    noFill();
    rect(x, y, side, side);
  }
}
