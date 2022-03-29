class NetworkAnimator{
  Network net;
  float r = 3;
  
  NetworkAnimator(Network net_){
  net = net_;
  }
  
  void render(){
    background(244);
    renderNodes(net);
    renderVerteces(net);
  }
  void renderNodes(Network net){
    fill(11);
    for(Node n : net.nodes){
      ellipse(n.pos.x, n.pos.y, r, r);
    }
  }
  
  void renderVerteces(Network net){
    for (Node n : net.nodes){
      int t = n.id;
      for (int s : n.neigh){
        if(t > s){
          line(net.nodes[s].pos.x, net.nodes[s].pos.y, net.nodes[t].pos.x, net.nodes[t].pos.y);
        }
      }
    }
  }
}
