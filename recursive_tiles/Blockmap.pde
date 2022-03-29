class Blockmap {
  Block[] block;
  int side, nx, ny;
  Blockmap(int side_) {
    side = side_;
    nx = width/side;
    ny = height/side;
    int n = (nx+1) * (ny+1);
    block = new Block[n];
    for (int y=0; y<height; y+=side) {
      for (int x=0; x<width; x+=side) {
        block[index(x,y)] = new Block(x, y, side);
      }
    }
  }
  void show() {
    for (int y=0; y<height; y+=side) {
      for (int x=0; x<width; x+=side) {
        block[index(x,y)].show();
      }
    }
  }
    
  int index(int x, int y){
    return int(y/side) * ny + int(x/side);
  }
}
