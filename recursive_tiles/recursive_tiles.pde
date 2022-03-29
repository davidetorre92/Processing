int sides; 
int rad;   //In pixels!
int iGlobal;
IntList currentTurn, nextTurn;
Blockmap bm;
Mesh mesh;

void setup() {
  size(500, 500);
  sides = 6;
  rad = 10;
  frameRate(30);

  bm = new Blockmap(rad);
  mesh = new Mesh(width/2, height/2, rad, sides);
  currentTurn = new IntList();
  nextTurn = new IntList();
}

void draw() {
  background(244);
  mesh.show();
  bm.show();
  updateLists();
}

void mouseReleased() {
  updateTile(mouseX, mouseY);
}

void updateLists() {
  currentTurn = nextTurn.copy();
  nextTurn = new IntList();
  for (int tile : currentTurn) {
    nextTurn = mesh.tiles.get(tile).update(nextTurn);
  }
}

void updateTile(int x, int y) {
  IntList tileList = bm.block[bm.index(x, y)].tiles;
  float mindist = 4*rad;
  int index = -1;
  for (int tileid : tileList) {
    float dx = mesh.tiles.get(tileid).x-x;
    float dy = mesh.tiles.get(tileid).y-y;
    float dist = sqrt(dx*dx+dy*dy);
    if (dist<mindist) {
      mindist=dist;
      index=tileid;
    }
  }
  mesh.tiles.get(index).state = 1;
  nextTurn = mesh.tiles.get(index).update(nextTurn);
}
