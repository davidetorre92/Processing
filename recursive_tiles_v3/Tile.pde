public class Tile{
  public float x, y;
  public float tilt;
  public int tileID;
  public int state;
  private int fillC;
  
  public Tile(float x_, float y_, float tilt_, int tileID_){
    x = x_;
    y = y_;
    tilt = tilt_;
    tileID = tileID_; //If tileID == -1 then it is a polygon that has not been added to the main tilemap yet.
    state = 0;
  }
  public void show(PShape tileShape){
    push();
    translate(x,y);
    rotate(tilt);
    if(state == 1){
      tileShape.setFill(color(fillC));
      tileShape.setStroke(color(11));
    } else {
      tileShape.setFill(244);
    }
    shape(tileShape, 0, 0);
    pop();
    
  }
  
  public void updateState(){
    state = 1;
    fillC = 11;
  }
  
} 
