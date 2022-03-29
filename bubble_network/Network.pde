class Network {
  private Bubble[] bubbles;
  private int n;
  private boolean grow_phase;
  private boolean pulse_phase;
  private float r_out;
  public Network(int n_, float r_threshold, float r_out_)
  {
    n = n_;
    r_out = r_out_;
    init_network(r_threshold, r_out);
    
  }

  public void show()
  {
    for (int i = 0; i < n; i++)
    {
      bubbles[i].show();
    }
  }

  public void grow()
  {
    for (int i = 0; i < n; i++)
    {
      for (int j = i+1; j < n; j++)
      {
      if(!bubbles[i].active && !bubbles[j].active) continue;
        float dist = dist(bubbles[i].x, bubbles[i].y, bubbles[j].x, bubbles[j].y);
        if (dist < bubbles[i].r * 0.5 + bubbles[j].r * 0.5 + 2)
        {
          bubbles[i].active = false;
          bubbles[j].active = false;
          break;
        }
      }
      if(!bubbles[i].active)
      { 
        float xc = bubbles[i].x - width/2;
        float yc = bubbles[i].y - height/2;
        if(sqrt(xc * xc + yc * yc) + bubbles[i].r < r_out) bubbles[i].active = false;
      }
    }
    for (int i = 0; i < n; i++)
    {
      if (bubbles[i].active == true) bubbles[i].update();
    }
  }

  private void init_network(float r_threshold, float r_out)
  {
    bubbles = new Bubble[n];
    for (int i = 0; i < n; i++)
    {
      boolean find_place = true;
      float x, y;
      x = 0;
      y = 0;
      println(i, "/", n);
      while (find_place)
      {
        float r = sqrt(random(r_out)*random(r_out));
        float theta = random(TWO_PI);
        x = r * cos(theta) + width * 0.5;
        y = r * sin(theta) + height * 0.5;
        int j = 0;
        for (j = 0; j < i; j++)
        {
          float dist = dist(x, y, bubbles[j].x, bubbles[j].y);
          if (dist < r_threshold)
          {
            break;
          }
        }
        if (j == i) find_place = false;
      }
      bubbles[i] = new Bubble(x, y, i, random(r_threshold/2));
    }
  }
}
