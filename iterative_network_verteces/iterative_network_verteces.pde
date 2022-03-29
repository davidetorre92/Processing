final int k = 4;
final float frac = 1./4;
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
  strokeWeight(2.5);
}

void draw() {
  if(frameCount>480) exit();
  network.render();
  network.updatePos();
  if(frameCount%60==0 && network.nodes.length<10000) network.update();
  //saveFrame("output/frame####.png");
}

void keyReleased() {
  if (key == 'k') {
    network.update();
  }
}

Node[] initRelPointsCenter(int k) {
  Node[] nodes;
  nodes = new Node[k];

  PVector pos = new PVector(width*0.5, height*0.5);
  int[] neigh = new int[k];
  int i;
  for (i = 0; i < k; i++) {
    neigh[i] = i+1;
  }

  nodes[0] = new Node(0, neigh, pos);
  for (int s = 1; s < k; s++) {
    float x = width*0.5;
    float y = height*0.5;
    print(s, ":");
    for (i = 0; i < k; i++) {
      neigh[i] = (s+i+1)%(k+1);
    }
    nodes[s] = new Node(s, neigh, pos);
  }
  return nodes;
}
