float freq = 20;
float delta = 2;
float phase;
float amp;
void setup()
{
  size(500, 500);
  amp = height/12.;
  freq = freq/height*TWO_PI;
  delta = delta/height*TWO_PI;
}

void draw()
{
  float x_shift = width/4;
  phase = frameCount/3.;
  background(11);
  fill(244);
  noStroke();
  for(float x=x_shift;x<width+x_shift;x+=freq*0.1)
  {
    float y0 = height/2.;
    float y = amp*(sin(freq*x+phase)+sin((freq+delta)*x+phase));
    ellipse(x-x_shift,y+y0,1,1);
  }
}
