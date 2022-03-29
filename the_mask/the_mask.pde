int n;
float r0, r1;
Engine e;
static int frequecies = 2;
static float rate =   1480;
float frameStop;

void setup(){
  
  size(1144, 1600);
  n = 20;
  r0 = 30*3;
  r1 = 450*3;
  e = new Engine(n, r0, r1);
  frameStop = rate-1;
  frameRate(rate);
  println(frameStop);
  noLoop();
}

void draw(){
  e.run();
  saveFrame("copertina/circle.png");
  exit();
}

int fac(int n){
  return go(n,1);
}

int go(int a, int b){
  if(a==1 || a==0){
    return b;
  }
  return go(a-1,b*a);
}
