class Network{
  Node[] nodes;
  int totNodes, totEdge;
  Network(Node[] nodes_){
    nodes = nodes_;
    totNodes = nodes.length;
    totEdge = 0;
    for(int i = 0; i < totNodes; i++){
      totEdge += nodes[i].totNeigh;
    }
  }
  
  void updateVertecesTurbot(){
    float h = 0.5;
    int i, j, sonind;
    int sontotEdge = 4 * totEdge;
    Node[] son = new Node[sontotEdge];
    sonind = 0;
    
    for (i = 0; i < totNodes; i++){
     son[sonind] = net.
    }
    for (i = 0; i < totNodes; i++){
      for(j = 0 ; j < nodes[i].totNeigh; j++){
        int[] neigh = new int[2];
        PVector pos, posStart, posEnd;
        neigh[0] = nodes[i].id;
        neigh[1] = nodes[nodes[i].neigh[j]].id;
        posStart = nodes[i].pos.copy();
        posEnd = nodes[nodes[i].neigh[j]].pos.copy();
        pos = posEnd.copy();
        pos.sub(posStart);
        pos.rotate(HALF_PI);
        pos.mult(h);
        pos.add(posStart);
        println(pos);
        son[sonind] = new Node(sonind, neigh, pos);
        sonind++;
      }
    }
    nodes = son;
  }
  
}
