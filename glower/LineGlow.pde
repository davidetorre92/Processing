class LineGlow
{
  float x1, y1;
  float x2, y2;
  float glowState = 0;
  color glowColorOn = color(244,0,0);
  color glowColorOff = color(11);
  float glowRadiusRatio = 2.0;
  float weight;
  float dirAngle;
  public LineGlow(float x1_, float y1_, float x2_, float y2_, float weight_)
  {
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    dirAngle = atan2(y2 - y1, x2 - x1);
    weight = weight_;
  }
  public void show()
  {
    color c = glowColor(glowState);
    stroke(c);
    strokeWeight(weight);
    line(x1, y1, x2, y2);

    float dglow = 0.5;
    for (float glow = dglow; glow <= glowState * glowRadiusRatio; glow += dglow) {
      stroke(c, 128*glow);
      strokeWeight(weight*(glowState * glowRadiusRatio - glow));
      line(x1, y1, x2, y2);
    }
  }
  private color glowColor(float glowState)
  {
    float r = lerp(red(glowColorOff), red(glowColorOn), glowState);
    float g = lerp(green(glowColorOff), green(glowColorOn), glowState);
    float b = lerp(blue(glowColorOff), blue(glowColorOn), glowState);
    return color(r, g, b);
  }
  public void glow(int TFramesGlow)
  {
    float arg = frameCount/(TFramesGlow+0.);
    glowState = (cos(arg)+1)*0.5;
  }
}
