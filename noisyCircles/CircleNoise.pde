class CircleNoise {
  float r;
  float thetaStart, thetaEnd;
  float noiseMax;
  final float dTheta = TWO_PI/(500+r);
  final float phase = random(0, TWO_PI);
  float gamma;
  float v_gamma;
  color stroke;
  
  CircleNoise(float r_, float rStart, float rEnd) {
    r = r_;
    noiseMax = 70.;
    gamma = 0.;
    v_gamma = TWO_PI/r/20;
    stroke = colorMe(r, rStart, rEnd);
  }

  void show() {
    noFill();
    strokeWeight(1);
    stroke(stroke);
    beginShape();
    for (float theta = 0; theta <= TWO_PI+dTheta; theta += dTheta) {
      float x = cos(theta);
      float y = sin(theta);
      float rNoised = r + noiseAmount(theta)*noise(noiseRatio()*(theta+gamma+phase));
      x *= rNoised;
      y *= rNoised;
      vertex(x, y);
    }
    endShape(CLOSE);
  }
  float noiseAmount(float theta) {
    if(theta > PI){
      theta = TWO_PI - theta;
    }
    float sig = PI/2;
    float mu = PI;
    float x = theta - mu;
    float arg = -x*x/sig;
    float ret = exp(arg)*noiseMax;
    return ret;
  }
  void update(){
    gamma -= v_gamma;
  }
  float noiseRatio(){
    return r/10.;
  }
  color colorMe(float x, float a, float b){
    color c = plasma (x,b,a);
    return c;
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
    red = ar*x*x*x+br*x*x+cr*x+dr;
    green = ag*x*x*x+bg*x*x+cg*x+dg;
    blue = ab*x*x*x+bb*x*x+cb*x+db;
    return color(red, green, blue);
  }

}
