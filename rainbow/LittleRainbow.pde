class LittleRainbow {
  float x0, y0, w, h;
  //Line[] l;
  LittleRainbow(float w_, float h_) {
    h = h_;
    w = w_;
    x0 = (width-w)*0.5;
    y0 = (height-h)*0.5;
    //l = new Line[256];
    
  }
  void show() {

    float dx = w/222.;
    float y = y0+h/2;
    int i = 0;
    strokeWeight(1);
    for (float x = x0; x < x0+w; x+=dx) {
      stroke(viridis(i, 0, 255));
      line(x, y0, x, y);
      i++;
    }
  }
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
