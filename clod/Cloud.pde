class Cloud {
  float x, y, x0, y0;
  int size;
  color c;
  int t;
  float T;
  Cloud(float x_, float y_, int size_, color c_) {
    x = x_;
    y = y_;
    x0 = x;
    y0 = y;
    size = size_;
    c = c_;
    t = 0;
  }
  void show() {
    float line_x0, line_y0;
    float line_x1, line_y1;
    float r1_x, r1_y, r1;
    float r2_x, r2_y, r2;
    y = y0 + hover(T);
    line_x0 = x - size;
    line_x1 = x + size;
    line_y0 = y + size/3;
    line_y1 = line_y0;
    stroke(c);
    strokeWeight(size);
    line(line_x0, line_y0, line_x1, line_y1);
    strokeWeight(1);
    fill(c);
    r1_x = x - size/4;
    r1_y = y - size/4;
    r1 = size/3*5;
    ellipse(r1_x, r1_y, r1, r1);
    r2_x = x + size/3;
    r2_y = y - size/4;
    r2 = size/5*6;
    ellipse(r2_x, r2_y, r2, r2);
    fill(11);
    stroke(11);
    float anim_T = eyes(T);
    ellipse(x-size/5*2, y, size/15, size/15*anim_T);
    ellipse(x+size/5*2, y, size/15, size/15*anim_T);
    arc(x, y, size/5*2, size/5*2, 0, PI);
  }

  void update() {
    t++;
    T = t/30.;
    if(T > 10) exit();
  }
  
  float eyes(float T){
    float T_start = 2;
    float T_end = 4;
    float delta_T = T_end - T_start;
    if(T < T_start || T > T_end) return 1;
    float ret = cos((T - T_start)/delta_T*TWO_PI);
    return ret;
  }
  
  float hover(float T){
    return 10*sin(T/5*TWO_PI);
  }
}
