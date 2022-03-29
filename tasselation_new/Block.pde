class Block {
  IntList things;
  int id;
  boolean thing;
  Offset p;

  Block(int x, int y, int id_) {
    p = new Offset(x, y);
    id = id_;
    things = new IntList();
    thing = false;
  }

  void show(int w, int h) {
    if (thing) {
      push();
      stroke(244, 0, 0);
      rect(p.x+1, p.y+1, w-2, h-2);
      pop();
      textOnBlock();
    } else {    
      rect(p.x, p.y, w, h);
    }
  }
  void textOnBlock() {
    push();
    fill(11);
    text(str(id), p.x, p.y+10);
    pop();
  }
}
