float noise_angle = 0.;
float scl = 2;
float dangle = 0.01;
void setup()
{
  size(1080, 1920);
}

void draw()
{
  background(228);
  translate(width/2, height/2);
  int SOn = 6;
  float dtheta = TWO_PI/SOn;
  stroke(11);
  strokeWeight(20);
  for (int i = 0; i < SOn; i++)
  {
    fill((i+1.)/SOn*244, 0, (SOn-i+0.)/SOn*244, 128);
    ellipse(210,
      0,
      800 * noise(cos(noise_angle)*scl, sin(noise_angle+1)*scl),
      1080 * noise(cos(noise_angle)*scl, sin(noise_angle)*scl)
      );
    rotate(dtheta);
  }
  for (int n = 0; n < 4; n++)
  {
    noStroke();
    for (int i = 0; i < SOn; i++)
    {
      fill((i+1.)/SOn*244, 0, (SOn-i+0.)/SOn*244, 128);
    ellipse(210,
      0,
      800 * noise(cos(noise_angle)*scl, sin(noise_angle+1)*scl),
      1080 * noise(cos(noise_angle)*scl, sin(noise_angle)*scl)
      );
      rotate(dtheta);
    }
  }
  noise_angle += dangle;
  saveFrame("tiktok/frame-####.png");
  if(noise_angle >= TWO_PI) exit();
}
