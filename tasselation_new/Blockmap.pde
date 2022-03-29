class Blockmap {
  Header head;
  int nBlocks;
  Block[] b;

  Blockmap(int rows, int cols, Thing t) {
    nBlocks = rows * cols;
    initHeader();
    initBlocks();
    setThing(t);
  }
  void show() {
    for (int i = 0; i<nBlocks; i++) {
      println(t.x, t.y, t.block_id);
      b[i].show(head.w, head.h);
    }
  }

  void update(Thing t) {
    t.update();
    setThing(t);
  }

  void initBlocks() {
    int w = int(width/rows);
    int h = int(height/cols);
    b = new Block[nBlocks];
    int i = 0;
    for (int x = 0; x<width; x+=w) {
      for (int y = 0; y<height; y+=h) {
        b[i] = new Block(x+head.x0, y+head.y0, i);
        i++;
      }
    }
  }

  void initHeader() {
    int w = int(width/rows);
    int h = int(height/cols);
    head = new Header(0, 0, rows, cols, w, h);
  }

  void setThing(Thing t) {
    t.block_id = getBlock(t.x, t.y);
    if (t.block_id != t.last_block_id && t.last_block_id != -1) {
      b[t.last_block_id].thing = false;
    }
    if (t.block_id!=-1) {
      b[t.block_id].thing = true;
    }
  }

  int getBlock(int x, int y) {
    int x_ind = int(x/head.w);
    int y_ind = int(y/head.h);
    int ret_ind = x_ind+y_ind*head.cols;
    ret_ind = max(ret_ind, -1);
    ret_ind = (ret_ind>=head.rows*head.cols)?(-1):(ret_ind);
    return x_ind*head.cols+y_ind;
  }
}
