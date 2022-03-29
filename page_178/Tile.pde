public class Tile{
  public float x, y;
  public float tilt;
  public int tileID;
  public int state;
  private color fillC;
  private int t;
  
  public Tile(float x_, float y_, float tilt_, int tileID_){
    x = x_;
    y = y_;
    tilt = tilt_;
    tileID = tileID_; //If tileID == -1 then it is a polygon that has not been added to the main tilemap yet.
    state = 0;
    t = 0;
  }
  public void show(PShape tileShape){
    push();
    translate(x,y);
    rotate(tilt);
    if(state == 1){
      fillC = viridis(t,0,500);
      tileShape.setFill(fillC);
      t = min(t+10,500);
      //tileShape.setStroke(color(11));
    } else {
      tileShape.setFill(244);
    }
    shape(tileShape, 0, 0);
    pop();
    
  }
  
  public void updateState1(){
    state = 1;
  }
  
    public void updateState2(){
    state = 0;
    t = 0;
    fillC = color(244);
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
    return color(red, green, blue);
  }  
} 
