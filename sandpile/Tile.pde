public class Tile{
  public float x, y;
  public float tilt;
  public int tileID;
  public int state;
  private color[] col;
  private int alpha=255;
  public Tile(float x_, float y_, float tilt_, int tileID_){
    x = x_;
    y = y_;
    tilt = tilt_;
    tileID = tileID_; //If tileID == -1 then it is a polygon that has not been added to the main tilemap yet.
    state = 0;
    col = new color[fallVal];
    for(int i=0; i<fallVal; i++){
      col[i] = plasma(i, fallVal-1, 0);
    }
    
  }
  public void show(PShape tileShape){
    push();
    translate(x,y);
    rotate(tilt);
    if(state >=fallVal){
      tileShape.setFill(col[fallVal-1]);
      //tileShape.setStroke(color(fillC));
    } else {
      tileShape.setFill(col[state]);
    }
    shape(tileShape, 0, 0);
    pop();
    
  }
  
  public void updateState(){
    state -=fallVal;
  }
  
  private color viridis(float x, float a, float b){
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
    return color(red, green, blue, alpha);
  }

  color plasma(float x, float a, float b){
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

    x = map(x,a,b,0,8);
    red   = ar*x*x*x+br*x*x+cr*x+dr;
    green = ag*x*x*x+bg*x*x+cg*x+dg;
    blue  = ab*x*x*x+bb*x*x+cb*x+db;
    return color(red, green, blue,alpha);
  }
  
} 
