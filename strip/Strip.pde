class Strip {
  float w;
  float xc, yc;
  float radius;
  float l, dl;
  float dtheta;
  float frameStop = 120.;
  int wobbles;
  color cup, cdown;
  Strip(float xc_, float yc_, float rad_, int wobbles_)
  {
    xc = xc_;
    yc = yc_;
    radius = rad_;
    w = radius / 20. * 3.;
    wobbles = wobbles_;
    dl = 0.01;
    l = TWO_PI*radius;
    dtheta = 1/(l/(dl*radius));
    cup = color(random(244), random(11), random(244));
    cdown = color(red(cup)*0.5, green(cup)*0.5, blue(cdown)*0.5);
  }
  void show()
  {
    float noise_arg = sin(frameCount/frameStop * TWO_PI);
    float phi;
    for (float theta = 0; theta < TWO_PI; theta += dtheta)
    {
      float x0, x1, y0, y1;
      float sint = sin(theta);
      float cost = cos(theta);
      float noise_val = noise(cost, sint, noise_arg);
      phi = wobbles * theta * noise(cost);
      float proj_w = w * cos(phi+noise_val);
      if (proj_w < 0) stroke(cup);
      else stroke(cdown);
      x0 = xc + (radius - proj_w * 0.5)*cost;
      y0 = yc + (radius - proj_w * 0.5)*sint;
      x1 = xc + (radius + proj_w * 0.5)*cost;
      y1 = yc + (radius + proj_w * 0.5)*sint;
      phi += dtheta;
      line(x0, y0, x1, y1);
      stroke(11);
      point(x0, y0);
      point(x1, y1);
    }
  }
}
