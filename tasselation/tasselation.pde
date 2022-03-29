int rowSize, colSize;
ArrayList<Cell> cells;
void setup(){
  size(500, 500);
  rowSize = 20;
  colSize = 20;
  int n = int(width*height/(rowSize*colSize));
  cells = new ArrayList<Cell>();
  for(int x = 0; x < width; x += rowSize){
    for(int y = 0; y < height; y += colSize){
      cells.add(new Cell(x, y, rowSize, colSize));
    } 
  }
}

void draw(){
  background(244);
  for(Cell c : cells){
    c.show();
    c.update();
  }
}
