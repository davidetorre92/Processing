public class Engine {
  private int nSides;
  private int rad, blockSide;
  private float a; //Apothem
  private PShape tileShape;
  private ArrayList<Block> blockmap;
  private ArrayList<Tile> tilemap;
  private int nTile = 0;
  private IntList currentTurn, nextTurn;

  public Engine(int nSides_, int rad_, int blockSide_) {
    nSides = nSides_;
    rad = rad_;
    a = rad * cos(PI/sides);
    blockSide = blockSide_;
    blockmap = initBlockMap(blockSide_);
    tilemap = initTileMap(rad, nSides);
    currentTurn = new IntList();
    nextTurn = new IntList();
  }

  public void clickEvent(int x, int y) {
    changeTileState(x, y);
  }

  public void run() {
    background(0);
    showTileMap();
    update();
  }

  private void update() {
    boolean[] InNextTurn = initInNextTurn(tilemap.size());
    ArrayList<Tile> updateTileList = updatingRule(currentTurn);
    for (Tile updateTile : updateTileList) {
      nextTurn.push(updateTile.tileID);
      for (Tile neigh : getNeigh(updateTile, nSides, a)) {
        neigh.state += 1;
        if (!InNextTurn[neigh.tileID]) {
          nextTurn.push(neigh.tileID);
          InNextTurn[neigh.tileID] = true;
        }
      }
    }
    currentTurn = nextTurn;
    nextTurn = new IntList();
  }

  private ArrayList<Tile> updatingRule(IntList currentTurn) {
    ArrayList<Tile> updateTileList = new ArrayList<Tile>();
    for (int tileID : currentTurn) {
      if (tilemap.get(tileID).state<fallVal) {
        continue;
      } else {
        tilemap.get(tileID).updateState();
        updateTileList.add(tilemap.get(tileID));
      }
    }
    return updateTileList;
  }

  private boolean[] initInNextTurn(int size) {
    boolean[] InNextTurn = new boolean[size];
    for (int i=0; i<size; i++) {
      InNextTurn[i] = false;
    }
    return InNextTurn;
  }

  private void changeTileState(float x, float y) {
    int selectedTile = getClosestTileID(x, y);
    if (selectedTile != -1) {
      tilemap.get(selectedTile).state=initVal;
      currentTurn.push(tilemap.get(selectedTile).tileID);
      for (Tile neigh : getNeigh(tilemap.get(selectedTile), nSides, a)) {
        currentTurn.push(neigh.tileID);
      }
    }
  }

  private int getClosestTileID(float x, float y) {
    int selectedTile = -1;
    float min_dist = 2*rad;
    for (int blockID : getBlockAndNeigh(x, y)) {
      if (blockID >=0 && blockID<blockmap.size()) {
        for (int tileID : blockmap.get(blockID).tilesInBLock) {
          float d = dist(x, y, tilemap.get(tileID).x, tilemap.get(tileID).y);
          if (d < min_dist) {
            min_dist = d;
            selectedTile = tileID;
          }
        }
      }
    }
    return selectedTile;
  }

  private ArrayList<Block> initBlockMap(int blockSide) {
    blockmap = new ArrayList<Block>();
    for (int x = 0; x < width; x += blockSide) {
      for (int y = 0; y < height; y += blockSide) {
        blockmap.add(new Block(x, y));
      }
    }
    return blockmap;
  }

  private void showTileMap() {
    for (Tile t : tilemap) {
      t.show(tileShape);
    }
  }
  private void showBlockMap() {
    for (Block b : blockmap) {
      b.show(blockSide);
    }
  }

  private IntList getBlockAndNeigh(float x, float y) {
    IntList neighList = new IntList();
    int mouseMapIndex = getBlockID(x, y);
    if (mouseMapIndex<0) return neighList;

    for (float xneigh = x - rad; xneigh <= x + rad; xneigh += rad) {
      for (float yneigh = y - rad; yneigh <= y + rad; yneigh += rad) {
        int neighIndex = getBlockID(xneigh, yneigh);
        if (neighIndex>=0 && neighIndex<blockmap.size()) neighList.push(neighIndex);
      }
    }
    return neighList;
  }

  private int getBlockID(float x, float y) {
    int nrows = int(width/blockSide);
    int nx, ny;
    nx = int(x/blockSide);
    ny = int(y/blockSide);
    if ((x<0 || x>width) || (y<0 || y>height)) return -1;
    return nx + ny*nrows;
  }

  private ArrayList<Tile> initTileMap(int rad, int nSides) {
    ArrayList<Tile> newComers = new ArrayList<Tile>();
    ArrayList<Tile> nextTurn = new ArrayList<Tile>();

    tileShape = initShape(rad, nSides);

    tilemap = new ArrayList<Tile>();
    a = rad * cos(PI/nSides);

    newComers.add(new Tile(width/2, height/2, 0., -1)); //Center of the grid

    while (newComers.size()!=0) {
      nextTurn = addTilesAndNextTurn(newComers);
      newComers = nextTurn;
      nextTurn = new ArrayList<Tile>();
    }
    return tilemap;
  }

  private ArrayList<Tile> cleanTheList(ArrayList<Tile> newComers) {
    ArrayList<Tile> actualNewComers = new ArrayList<Tile>();
    for (Tile newComer : newComers) {
      if (addOrNot(newComer)) {
        actualNewComers.add(newComer);
      }
    }
    return actualNewComers;
  }


  private ArrayList<Tile> addTilesAndNextTurn(ArrayList<Tile> newComers) {

    ArrayList<Tile> nextTurn = new ArrayList<Tile>();
    newComers = cleanTheList(newComers);  //First check if there are any tiles that overlaps the tiles that are already signed into the tile map
    for (Tile newComer : newComers) {
      boolean addMe = addOrNot(newComer);
      if (addMe) {
        tilemap = AddAndSign(newComer, tilemap);
        for (Tile newTile : makeNeigh(newComer, nSides, a)) {
          nextTurn.add(newTile);
        }
      }
    }
    return nextTurn;
  }

  private ArrayList<Tile> makeNeigh(Tile tile, int nSides, float a) {

    float startAngle=getStartingAngle(tile, nSides);
    float dAngle=getDAngle(tile, nSides);

    ArrayList<Tile> neighsList = new ArrayList<Tile>();
    for (float angle=startAngle; angle<TWO_PI+startAngle; angle+=dAngle) {
      float xNew=tile.x+2*a*cos(angle);
      float yNew=tile.y+2*a*sin(angle);
      float tiltNew = getTiltNewPolygon(tile, angle, nSides);
      Tile newTile = new Tile(xNew, yNew, tiltNew, -1);
      //boolean addMe;
      //addMe = addOrNot(newTile);
      //if (true) {
      neighsList.add(newTile);
      //}
    }
    return neighsList;
  }

  private ArrayList<Tile> getNeigh(Tile tile, int nSides, float a) {

    float startAngle=getStartingAngle(tile, nSides);
    float dAngle=getDAngle(tile, nSides);

    ArrayList<Tile> neighsList = new ArrayList<Tile>();
    for (float angle=startAngle; angle<=TWO_PI+startAngle; angle+=dAngle) {
      float xNew=tile.x+2*a*cos(angle);
      float yNew=tile.y+2*a*sin(angle);
      float tiltNew = getTiltNewPolygon(tile, angle, nSides);
      int tileIDNeigh = getClosestTileID(xNew, yNew);
      if (tileIDNeigh>=0) {
        Tile neighTile = tilemap.get(tileIDNeigh);
        boolean inList = false;
        for(Tile n : neighsList){
          if(n.tileID == tileIDNeigh){
            inList = true;
            break;
          }
        }
        if(inList==false){
          neighsList.add(neighTile);
        }
      }
    }
    return neighsList;
  }


  private float getDAngle(Tile fatherTile, int nSides) {
    return TWO_PI/nSides;
  }

  private ArrayList<Tile> AddAndSign(Tile newTile, ArrayList<Tile> tilemap) {
    tilemap.add(new Tile(newTile.x, newTile.y, newTile.tilt, nTile));
    int blockID = getBlockID(newTile.x, newTile.y);
    blockmap.get(blockID).tilesInBLock.push(nTile);
    nTile++;
    return tilemap;
  }

  private boolean addOrNot(Tile tile) {
    if ((tile.x<0 || tile.x>=width) || (tile.y<0 || tile.y>=height)) {
      return false;
    } else {
      for (int blockID : getBlockAndNeigh(tile.x, tile.y)) {
        if (blockID>=0) {
          for (int tileID : blockmap.get(blockID).tilesInBLock) {
            float d = dist(tile.x, tile.y, tilemap.get(tileID).x, tilemap.get(tileID).y);
            if (d < 2*a-EPSILON) {
              return false;
            }
          }
        }
      }
      return true;
    }
  }

  private float getTiltNewPolygon(Tile father, float angle, int nSides) {
    if (nSides%2 == 0) {
      return 0;
    } else {
      float fatherTilt = father.tilt;
      return fatherTilt+PI;
    }
  }

  private float getStartingAngle(Tile father, int nSides) {
    if (nSides%2 == 0) {
      return PI/nSides;
    } else {
      float fatherTilt = father.tilt;
      return (fatherTilt+PI)/nSides;
    }
  }

  private PShape initShape(int rad, int nSides) {
    PShape returnShape = createShape();
    returnShape.beginShape();

    float deltaAngle = TWO_PI/nSides;
    for (float angle = 0.; angle <= TWO_PI; angle +=deltaAngle) {
      float x = rad * cos(angle);
      float y = rad * sin(angle);
      returnShape.vertex(x, y);
    }
    //returnShape.strokeWeight(0);
    returnShape.noStroke();
    returnShape.endShape();
    returnShape.setFill(244);

    return returnShape;
  }
}
