class Block{
  private int xtopleft, ytopleft;
  public IntList tilesInBLock;
  
  public Block(int xtopleft_, int ytopleft_){
    xtopleft = xtopleft_;
    ytopleft = ytopleft_;
    tilesInBLock = new IntList();
  }
  
  public void show(int sidelen){
    stroke(11,11);
    noFill();
    rect(xtopleft, ytopleft, sidelen, sidelen);
  }
  
}
