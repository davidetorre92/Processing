float r = 60;
float dr = 20;
float theta = 0;
float dtheta = TWO_PI*0.05;

void setup()
{
  size(1080, 1080); 
  background(244);
  strokeWeight(8);
}

void draw()
{
  noFill();
  translate(width*0.5, height*0.5);
  int which = random(1) > 0.98 ? 1:0;
  int where = (int)(random(0,2)) * 2 - 1;
  println(which, where);
  r += dr*which;
  theta += dtheta*(1-which)*where;

  r = constrain(r, dr*2, width*0.5);

  stroke(11);
  rotate(theta);
  if(which == 0) arc(0,0, 2*r, 2*r, 0, dtheta);
  if(which == 1) line(r, 0, r-dr, 0);
  if(frameCount > 1000)
  {
     saveFrame("instagram/frame_white_nograd.png");
     exit();
  }
  
}

color plasma(float x, float a, float b) {
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

  x = map(x, a, b, 0, 8);
  red   = ar*x*x*x+br*x*x+cr*x+dr;
  green = ag*x*x*x+bg*x*x+cg*x+dg;
  blue  = ab*x*x*x+bb*x*x+cb*x+db;
  return color(red, green, blue);
}
