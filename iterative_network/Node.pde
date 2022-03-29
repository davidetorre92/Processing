class Node{
  int id;
  int[] neigh;
  PVector pos;
  Node(int id_, int[] neigh_, PVector pos_){
    id = id_;
    neigh = new int[neigh_.length];
    arrayCopy(neigh_, neigh);
    pos = pos_.copy();
  }
}
