void setup()
{
  size(500, 500); 
  noLoop();
}

void draw()
{
  float diam = 400;
  background(202);
  noFill();
  ellipse(width/2, height/2, diam, diam);
  ellipse(width/2, height/2 + diam/4, diam/2, diam/2);
  ellipse(width/2, height/2 - diam/4, diam/2, diam/2);
  ellipse(width/2 + diam/3., height/2 + diam/4, diam/6, diam/6);
  ellipse(width/2 + diam/3., height/2 - diam/4, diam/6, diam/6);
  ellipse(width/2 + diam/8., height/2 + diam/12, diam/6, diam/6);
  ellipse(width/2 + diam/8., height/2 - diam/12, diam/6, diam/6);
}
