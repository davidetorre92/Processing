class Node{
  int x, y;
  int v0x, v0y;
  
  Node(){
    x = int(random(width));
    y = int(random(height));
    v0x = int(random(-10,10));
    v0y = int(random(-10,10));
  }
  void show(){
    ellipse(x, y, 10, 10);
  }
  void update(){
    x += v0x;
    y += v0y;
    
  }
}
