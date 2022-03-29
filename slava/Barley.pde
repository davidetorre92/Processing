class Barley {
  private float x, y, size_h, size_w;
  private float ratio;
  private int n_piece = 3;
  private color c;
  private float strenght;
  private float[] angle_t;
  Barley(float x_, float y_, float size_)
  {
    x = x_;
    y = y_;
    size_h = size_;
    ratio = 0.25;
    size_w = ratio * size_h;
    c = color(200 + random(0, 50.), 200 + random(0, 50.), 0);
    angle_t = new float[n_piece];
    for (int n = 0; n < n_piece; n++)
    {
      angle_t[n] = 0;
    }
    strenght = 1;
  }

  void show() {
    noStroke();
    rectMode(CORNERS);
    fill(c);
    pushMatrix();
    translate(x, y);
    for (int n = 0; n < n_piece; n++)
    {
      rotate(angle_t[n]);
      rect(size_w/2, size_h);
      translate(0, -size_h);
    }
    popMatrix();
    fill(0);
    pushMatrix();
    translate(x, y);
    for (int n = 0; n < n_piece; n++)
    {
      rotate(angle_t[n]);
      ellipse(0, 0, 4, 4);
      translate(0, -size_h);
    }
    popMatrix();
  }
  void update()
  {
    float angle = map(mouseY, 0, height, 0, PI);
    angle_t[n_piece - 1] = angle;
    for (int n = n_piece - 2; n >= 0; n--)
    {
      angle_t[n] = angle_t[n+1] * strenght;
      
    }
  }
}
