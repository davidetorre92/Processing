public class Tile {
  public float x, y;
  public float tilt;
  public int tileID;
  public int state;
  private int fillC, minFillC, maxFillC;
  private int t;

  public Tile(float x_, float y_, float tilt_, int tileID_) {
    x = x_;
    y = y_;
    tilt = tilt_;
    tileID = tileID_; //If tileID == -1 then it is a polygon that has not been added to the main tilemap yet.
    state = 0;
    minFillC = 11;
    maxFillC = 244;
  }
  public void show(PShape tileShape) {
    push();
    translate(x, y);
    rotate(tilt);
    if (state == 1) {
      fillC = updateFill(minFillC, maxFillC);
      tileShape.setFill(color(fillC));
    } else {
      tileShape.setFill(color(maxFillC));
    }
    shape(tileShape, 0, 0);
    pop();
    if(fillC == maxFillC){
      //state = 0;
    }
  }

  public void updateState() {
    state = 1;
    t = 0;
    fillC = updateFill(minFillC, maxFillC);
  }

  private color updateFill(int minFillC, int maxFillC) {
    float T = t*0.5;
    float T2 = 0.25*frameRate;
    t++;
    int value = int(minFillC+(maxFillC-minFillC)*exp(-T));
    //if (t<T2) {
    //  value = int(minFillC+(maxFillC-minFillC)*exp(-T));
    //} else {
    //  value = int(min(minFillC+20*(t-T2), maxFillC));
    //}
    return value;
  }
}
