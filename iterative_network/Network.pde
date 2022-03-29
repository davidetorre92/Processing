class Network {
  Node[] nodes;
  PVector[] targetPos;
  int r;

  Network(Node[] net) {
    nodes = net;
    targetPos = initNodesRegShape(k);
    r = 5;
  }

  void render() {
    background(244);
    //renderEdges();
    renderVerteces();
  }
  
  void updatePos(){
    for(int n=0; n<nodes.length; n++){
      nodes[n].pos.x = (targetPos[n].x - nodes[n].pos.x)*0.05 + nodes[n].pos.x;
      nodes[n].pos.y = (targetPos[n].y - nodes[n].pos.y)*0.05 + nodes[n].pos.y;
    }
  }

  PVector[] initNodesRegShape(int k) {
    PVector[] pos = new PVector[k+1];
    float radius = min(width, height)*0.5*radiusFrac;
    pos[0] = new PVector(width*0.5, height*0.5);
    for (int s = 1; s < k+1; s++) {
      float theta = TWO_PI/k * s;
      float x = radius * cos(theta) + width*0.5;
      float y = radius * sin(theta) + height*0.5;
      pos[s] = new PVector(x, y);
    }
    return pos;
  }

  void update() {
    int sonLen = nodes.length * k;
    Node[] son = new Node[sonLen];
    PVector[] newTargetPos = new PVector[sonLen];
    int[][] sonsGenUncleLookUpTable = new int[sonLen][2];
    int[][] genSonsLookUpTable = new int[nodes.length][k];
    int sonInd=0;
    println("---SONGENUNCLELUP---");
    for (Node n : nodes) {
      int t = n.id;
      for (int neighInd=0; neighInd<k; neighInd++) {
        genSonsLookUpTable[t][neighInd] = sonInd;
        sonsGenUncleLookUpTable[sonInd][0] = t;
        sonsGenUncleLookUpTable[sonInd][1] = n.neigh[neighInd];
        print(sonInd, ":", sonsGenUncleLookUpTable[sonInd][0], " ", sonsGenUncleLookUpTable[sonInd][1], "\n");
        sonInd++;
      }
    }
    print("\n");
    for (int n = 0; n<sonLen; n++) {
      print(n, ":");
      int[] newNeigh = new int[k];
      int s = 0;
      int b = 0;
      int genInd = sonsGenUncleLookUpTable[n][0];
      while (s < k-1) {
        int proposed = genSonsLookUpTable[genInd][b];
        if (proposed != n) {
          newNeigh[s] = proposed;
          print(" ", proposed);
          s++;
        }
        b = (b+1)%k;
      }
      int uncleInd = sonsGenUncleLookUpTable[n][1];
      for (int neighInd=0; neighInd<k; neighInd++) {
        int proposed = genSonsLookUpTable[uncleInd][neighInd];
        if (sonsGenUncleLookUpTable[proposed][1] == genInd && proposed != n) {
          newNeigh[k-1] = proposed;
          print(" ", proposed);
          break;
        }
      }
      print("\n");
      PVector posGen = nodes[genInd].pos.copy();
      PVector posUncle = nodes[uncleInd].pos.copy();
      newTargetPos[n] = posUncle.copy();
      newTargetPos[n].sub(posGen);
      newTargetPos[n].mult(frac).add(posGen);
      son[n] = new Node(n, newNeigh, posGen);
    }
    targetPos = newTargetPos;
    nodes = son;
  }

  void renderEdges() {
    for (Node n : nodes) {
      ellipse(n.pos.x, n.pos.y, r, r);
    }
  }
  void renderVerteces() {
    for (Node n : nodes) {
      int t = n.id;
      for (int s : n.neigh) {
        if (t < s) {
          line(nodes[s].pos.x, nodes[s].pos.y, nodes[t].pos.x, nodes[t].pos.y);
        }
      }
    }
  }
}
