class Circle{
  float r;
  color col;
  float theta, omega;
  int wise;
  Circle(float r_, color col_){
    r = r_;
    col = col_;
    omega = (int)(random(frequecies)+1)/(rate+0.)*TWO_PI;
    theta = random(TWO_PI);
    wise = int(random(2))*2-1;
  }
  void show(){
    fill(col);
    arc(width/2, height/2, r, r, theta, theta+PI); 
  }
  void update(){
    theta += wise*omega;
  }
}
