void setup()
{
  size(500, 500);
}

void draw()
{
  background(220);
  float dtheta = 0.1;
  float r = 150;
  float r_int = 10;
  fill(11);
  noStroke();
  translate(width/2, height/2);
  ellipse(0, 0, 5, 5);
  translate(30, 30);
  ellipse(0, 0, 5, 5);
  translate(100, 30);
  fill(244,0,0);
  ellipse(0,0,5,5);
  fill(11);
  for(float theta_ext = 0; theta_ext < TWO_PI; theta_ext += dtheta)
  {
    ellipse(r_int * cos(theta_ext), r_int * sin(theta_ext), 5, 5);
  }
}
