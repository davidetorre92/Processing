class Vector {
  float x, y;
  float angle;
  final int len = 5;
  final float ylen = height/(nrow+0.);
  final float xlen = width/(ncol+0.);
  final color fill = color(random(244), 0, 0);
  final float alpha = random(244);
  Vector(float x_, float y_) {
    x = x_;
    y = y_;
    angle = get_angle(0);
  }

  void display() {
    push();
    translate(x, y);
    rotate(angle);
    debug();
    brush1();
    pop();
  }
  void update(float z) {
    angle = get_angle(z);
  }
  float get_angle(float z) {
    float noiseSpeed = 0.005;
    angle = noise(x*noiseSpeed, y*noiseSpeed, z*noiseSpeed)+0.5;
    angle *= TWO_PI;
    return angle;
  }
  void debug(){
    line(0, 0, 0, len);
  }
  void brush1(){
    fill(fill);
    ellipse(0,0, 2*xlen, 4*ylen);
  }
  
}
