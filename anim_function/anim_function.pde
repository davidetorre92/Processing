float scalex = 150.;
float scaley = 150.;
float maxder = 0;
float minder = 0;
float sp = 200.;

void setup() {
  size(1500, 1500);
  noStroke();
  fill(11);
  for (float x=0; x<=width; x+=0.01) {
    minder = min(minder, f_der(x));
    maxder = max(minder, f_der(x));
  }
  println(minder, maxder);

}

void draw() {
  float dx=0.5;
  background(244);

  for (float x=0; x<=width; x+=dx) {
    pt(x, f(x)+height/2);
  }
  if(ph()>=TWO_PI) exit();
  saveFrame("output/frame-#####.png");
  println(frameCount + "/" + TWO_PI*sp);
}

float f(float x) {
  float phase = ph();
  float argosc = argsc(x);
  return sin(x/width*PI)*scaley*(sin(argosc + phase) + sin(1.05*argosc + phase));
}

void pt(float x, float y) {

  color col = viridis(f_der(x), maxder, minder);
  fill(col);
  ellipse(x, y, 3*3, 3*3);
}

float f_der(float x) {
  float phase = ph();
  float argosc = argsc(x);

  return cos(x/width*PI)*scaley*(sin(argosc + phase) + sin(1.05*argosc + phase)) + sin(x/width*PI)*scaley*(argosc*cos(argosc + phase) + 1.05*argosc*cos(1.05*argosc + phase));
}

float argsc(float x) {
  return 25.*x/scalex;
}

float ph() {
  return frameCount / sp;
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
