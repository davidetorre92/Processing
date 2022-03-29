class CirclePack
{
  public float x0, y0;
  public float x, y;
  public float r, r0;
  public color c;
  
  private int _strokeWeight = 2;
  private boolean _noFill = false;
  private boolean _updateable = true;
  private float _dr = 1;
  private float _space = _strokeWeight * 2.2;
  public CirclePack(float x_, float y_, float r_, color c_){
    x0 = x_;
    y0 = y_;
    r = r_;
    c = c_;
    x = x0;
    y = y0;
  }
  
  public void show()
  {
    if(_noFill) noFill();
    else fill(c);
    strokeWeight(_strokeWeight);
    stroke(c);
    ellipse(x,y,2*r,2*r);
  }
  
  public void update(ArrayList<CirclePack> circles)
  {
    if(_updateable)
    {
       if(!amIUpdatable(circles))
       {_updateable = false; 
        r0 = r;
       }
    }
    if(_updateable) r += _dr;
    else{
      //x = x0 + 20 * (noise(cos(frameCount/60.) + x0) - 0.5);
      //y = y0 + 20 * (noise(sin(frameCount/60.) + y0) - 0.5);
      r = r0 * (0.4 * sin(frameCount/90.*TWO_PI + x)+ 0.5);
    }
  }
  
  private boolean amIUpdatable(ArrayList<CirclePack> circles)
  {
    for(CirclePack c : circles)
    {
      float dist = dist(c.x, c.y, x, y);
      if((dist > 0) && (dist < r + c.r + _space)) return false;
    }
    return true;
  }
  
}
