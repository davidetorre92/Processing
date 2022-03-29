class Node{
  public int id;
  public int[] neigh;
  public int totNeigh;
  public PVector pos;
  public Node(int id_, int[] neigh_, PVector pos_){
    id = id_;
    totNeigh = neigh_.length;
    neigh = new int[totNeigh];
    arrayCopy(neigh_, neigh);
    pos = pos_.copy();
  }
}
