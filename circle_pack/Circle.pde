class Circle {

  float x, y;
  float r;
  color c;
  Circle(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;
    c = viridis(int(random(N_colors)), 0, N_colors-1);
  }

  public void show() {
    stroke(c);
    ellipse(x, y, r, r);
  }

  public boolean check_and_update(Circle[] check_list) {
    boolean update_me = true;
    for (Circle c : check_list) {
      float dist_x = c.x - x;
      float dist_y = c.y - y;
      float dist = dist_x*dist_x+dist_y*dist_y;
      dist = sqrt(dist);
      //print("\n\t",dist,r,c.r);
      if (dist*2 <= r + c.r +sw*2) {
        update_me = false;
        break;
      }
    }
    //print("\n");
    return update_me;
  }

  public boolean constr() {
    boolean update_me = true;
    float dist_x = width*0.5 - x;
    float dist_y = height*0.5 - y;
    float dist = dist_x*dist_x+dist_y*dist_y;
    dist = sqrt(dist);
    //print("\n\t",dist,r,c.r);
    if (dist + r*0.5 >= R_ext - sw*2) {
      update_me = false;
    }
    //print("\n");
    return update_me;
  }

  private color viridis(float x, float a, float b) {
    float red, green, blue;
    float ar = 0.888306;
    float br = -5.63986;
    float cr = -0.0922688;
    float dr = 72.7692;

    float ag = -0.0501166;
    float bg = -0.747669;
    float cg = 36.3502;
    float dg = 2.68112;

    float ab = 0.287685;
    float bb = -7.96329;
    float cb = 42.3236;
    float db = 83.5413;

    x = map(x, a, b, 0, 10);
    red   = ar*x*x*x+br*x*x+cr*x+dr;
    green = ag*x*x*x+bg*x*x+cg*x+dg;
    blue  = ab*x*x*x+bb*x*x+cb*x+db;
    return color(red, green, blue);
  }
}
