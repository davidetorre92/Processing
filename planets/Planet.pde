class Planet{
  float r;
  float dim;
  color col;
  float theta, omega;
  Planet(float r_, float omega_){
    r = r_;
    dim = 5;
    omega = omega_;
    theta = 0;
    col = color(11);
  }
  void show(){
    noFill();
    ellipse(0,0,2*r,2*r);
    float x = r*cos(theta);
    float y = r*sin(theta);
    fill(col);
    ellipse(x,y,5,5);
  }
  void update(){
    theta += omega;
  }
}
