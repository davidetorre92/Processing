NetworkAnimator engine;
Network startNet;

void setup(){
  size(500, 500);
  startNet = initNetLine();
  engine = new NetworkAnimator(startNet);
  noLoop();
}

void draw(){
  engine.net.updateVertecesTurbot();
  engine.render();
  
}

Network initNetLine(){
  float networkRadiusFrac = 0.8;
  Network startNet;
  Node[] net = new Node[2];
  int id;
  int[] neigh = new int[1];
  PVector pos;
  
  
  id = 0;
  neigh[0] = 1;
  pos = new PVector(width*0.5, height*0.5*(1+networkRadiusFrac));
  net[id] = new Node(id, neigh, pos);
  id = 1;
  neigh[0] = 0;
  pos = new PVector(width*0.5, height*0.5*(1-networkRadiusFrac));
  net[id] = new Node(id, neigh, pos);
  startNet = new Network(net);
  return startNet;
}
