class Engine {
  color lineColor;
  float noiseAmout;
  float rStart, rEnd;
  float v_gamma;
  int n;
  final int x0 = width/2;
  final int y0 = height/2;
  ArrayList<CircleNoise> circles;  
  Engine(int _n){
    n = _n;
    lineColor = color(11);
    rStart = 50;
    rEnd = 200;
    circles = new ArrayList<CircleNoise>();
    float dr = (rEnd-rStart)/n;
    for(float r=rEnd; r>=rStart; r-=dr){
      circles.add(new CircleNoise(r, rStart, rEnd));  
    }
  }
  void run(){
    bkg();
    translate(x0, y0);
    rotate(PI/2);
    for(CircleNoise c: circles){
      c.show();
      c.update();
    }
  }
  void bkg(){
    background(244);
  }
}
