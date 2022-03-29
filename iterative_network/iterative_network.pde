final int k = 3;
final float frac = 1./3;
final float radiusFrac = 1; //radiusFrac € (0,1)
Network network;

void setup() {
  //if (radiusFrac<=0 || radiusFrac >=1) {
  //  println("radiusFrac is the size of the network shape. radiusFrac !€ (0,1). Enter a proper value. Aborting...");
  //  exit();
  //}
  size(500, 500);
  Node[] init = initRelPointsCenter(k);
  network = new Network(init);
  fill(11);
  strokeWeight(0.5);
}

void draw() {
  network.render();
  network.updatePos();
  if(frameCount%60==0) network.update();
}

void keyReleased() {
  if (key == 'k') {
    network.update();
  }
}

Node[] initRelPointsCenter(int k) {
  Node[] nodes;
  nodes = new Node[k+1];

  println("---INIT NETWORK---");
  PVector pos = new PVector(width*0.5, height*0.5);
  int[] neigh = new int[k];
  int i;
  print(0, ":");
  for (i = 0; i < k; i++) {
    neigh[i] = i+1;
    print(neigh[i], " ");
  }
  print(pos.x, pos.y, "\n");

  nodes[0] = new Node(0, neigh, pos);
  for (int s = 1; s < k+1; s++) {
    float x = width*0.5;
    float y = height*0.5;
    print(s, ":");
    pos = new PVector(x, y);
    for (i = 0; i < k; i++) {
      neigh[i] = (s+i+1)%(k+1);
      print(neigh[i], " ");
    }
    print(pos.x, pos.y, "\n");
    nodes[s] = new Node(s, neigh, pos);
  }
  return nodes;
}
