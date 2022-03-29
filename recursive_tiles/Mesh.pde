class Mesh {
  int xc, yc, tsize, sides;
  PShape tshape;
  ArrayList<Tile> tiles;
  float h;
  Mesh(int xc_, int yc_, int tsize_, int sides_) {
    xc = xc_;
    yc = yc_;
    tsize = tsize_;
    sides = sides_;
    h = tsize*cos(PI/sides);
    init();
  }

  void show() {
    for (Tile t : tiles) {
      t.show();
    }
  }

  void update(int tileid) {
    tiles.get(tileid).state = 1;
  }

  void init() {
    initShape();
    tiles = new ArrayList<Tile>();
    iGlobal = 0;
    tiles.add(new Tile(xc, yc, tshape, iGlobal));
    makeNeigh(iGlobal, h);
  }

  void initShape() {
    tshape = createShape();
    tshape.beginShape();
    for (float angle=0.; angle<TWO_PI; angle+=TWO_PI/sides) {
      tshape.vertex(tsize*cos(angle), tsize*sin(angle));
    }
    tshape.endShape();
  }

  void updateNeigh(int i1, int i2) {
    tiles.get(i1).neighbours.push(i2);
    tiles.get(i2).neighbours.push(i1);
  }
  void makeNeigh(int tileid, float h) {
    for (float angle = PI/sides; angle <= TWO_PI; angle+=TWO_PI/sides) {
      float xn = 2*h*cos(angle)+tiles.get(tileid).x;
      float yn = 2*h*sin(angle)+tiles.get(tileid).y;
      if ( (xn>0 && xn<width) && (yn>0 && yn<height) && emptyCell(xn, yn, tileid)) {
        iGlobal++;
        //println(iGlobal, ":", xn, yn);
        tiles.add(new Tile(xn, yn, tshape, iGlobal));
        updateNeigh(tileid, iGlobal);
        makeNeigh(iGlobal, h);
      }
    }
  }

  boolean emptyCell(float xn, float yn, int thisTile) {
    int blockmapindex = bm.index(int(xn), int(yn));
    boolean empty = true;
    for (int tileind : bm.block[blockmapindex].tiles) {
      float dx = tiles.get(tileind).x-xn;
      float dy = tiles.get(tileind).y-yn;
      float dist = sqrt(dx*dx+dy*dy);
      if (dist<h) {
        empty = false;
        updateNeigh(thisTile, tileind);
        return empty;
      }
    }
    return empty;
  }
}
