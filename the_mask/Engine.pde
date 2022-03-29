class Engine{
  int n;
  float r0, r1;
  ArrayList<Circle> circles;
  Engine(int n_, float r0_, float r1_){
    n = n_;
    r0 = r0_;
    r1 = r1_;
    initCirc(n);
  }
  
  void run(){
    bkg();
    noStroke();
    for(Circle c : circles){
      c.show();
      c.update();
    }
  }
  
  void initCirc(int n){
    circles = new ArrayList<Circle>();
    for(int i=0; i<n; i++){
      float r = map(i,0,n-1,r1,r0);
      color col = plasma(r, r1, r0);
      circles.add(new Circle(r, col));
    }
  }
  
  void bkg(){
    background(244);
  }
  
    color viridis(float x, float a, float b){
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

    x = map(x,a,b,0,10);
    red   = ar*x*x*x+br*x*x+cr*x+dr;
    green = ag*x*x*x+bg*x*x+cg*x+dg;
    blue  = ab*x*x*x+bb*x*x+cb*x+db;
    return color(red, green, blue);
  }
  
    private color plasma(float x, float a, float b){
    float red, green, blue;
    float ar = -1.11111;
    float br = 6.75;
    float cr = 43.3611;
    float dr = -1;
    
    float ag = 0.997475;
    float bg = -7.6461;
    float cg = 19.5556;
    float dg = 62.9848;

    float ab = -0.111111;
    float bb = -6.79761;
    float cb = 40.0754;
    float db = 91.8333;

    x = map(x,a,b,0,10);
    red   = ar*x*x*x+br*x*x+cr*x+dr;
    green = ag*x*x*x+bg*x*x+cg*x+dg;
    blue  = ab*x*x*x+bb*x*x+cb*x+db;
    return color(red, green, blue);
  }
 
}
