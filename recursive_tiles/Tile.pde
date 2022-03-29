class Tile {
  float x, y;
  float tilt;
  PShape tshape;
  int uid;
  int state;
  IntList neighbours;
  int blockmap;
  Tile(float x_, float y_, PShape shape_, int uid_) {
    x = x_;
    y = y_;
    tilt = 0;
    tshape = shape_;
    uid = uid_;
    neighbours = new IntList();
    updateBlockmap();
    state = 0;
  }
  void show() {
    if (state == 1) {
      tshape.setFill(0);
    } else {
      tshape.setFill(244);
    }
    shape(tshape, x, y);
    fill(11);
    text(uid, x, y);
  }

  IntList update(IntList self) {
    for (int nblookup : neighbours) {
      int sum = 0;
      for (int nb : mesh.tiles.get(nblookup).state) {
        sum +=mesh.tiles.get(nb).state;
      }
      if (sum == 1) {
        state = 1;
      }
    }
    return self;
  }

  void updateBlockmap() {
    blockmap = bm.index(int(x), int(y));
    bm.block[blockmap].tiles.push(uid);
  }
}
