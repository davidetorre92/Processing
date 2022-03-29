class Cell{
  int x, y;       //Top left corner
  int xS, yS;     //Side size of the cell
  Cell(int x_, int y_, int xS_, int yS_){
    x = x_;
    y = y_;
    xS = xS_;
    yS = yS_;
  }
  void show(){
    stroke(11);
    rect(x, y, x + xS, y + yS);
  }
}
