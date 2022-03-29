class Thing{
  int x, y;
  int last_block_id, block_id;
  Thing(){
    x = mouseX;
    y = mouseY;
  }
  
  void update(){
    x = mouseX;
    y = mouseY;
    last_block_id = block_id;
  }
  
  void show(){
    push();
    fill(11);
    ellipse(x,y,3,3);
    pop();
  }
}
