class Sky
{
  float h = 0;
  float brightness;
  float T_unit;
  float dy;
  int tot_phases = 3;
  float[] phase_t_end;
  float[] transition_t;
  public Sky(float tu, int n_strip)
  {
    T_unit = tu;
    dy = height/n_strip;
    phase_t_end = new float[tot_phases];
    transition_t = new float[tot_phases];
    phase_t_end[0] = 0.5;
    phase_t_end[1] = 0.6;
    phase_t_end[2] = 1.0;
    transition_t[0] = 0.3;
    transition_t[1] = 0.1;
    transition_t[2] = 0.3;
  }

  void show(int frame)
  {
    float t = frame/T_unit - int(frame/T_unit);
    for (int y = 0; y < height; y += dy)
    {
      fill(interpolate(t, y));
      noStroke();
      rectMode(CORNER);
      rect(0, y, width, y + dy);
    }
  }
  
  color interpolate(float t, float y)
  {
    color[] phase_color = new color[tot_phases];
    color ret;
    phase_color[0] = daylight(y, 0, height-dy);
    phase_color[1] = sunset(y, 0, height-dy);
    phase_color[2] = night_sky(y, 0, height-dy);
    int phase = 0;
    int next_phase;
    while(t > phase_t_end[phase])
    {
      phase++; 
    }
    
    next_phase = (phase + 1)%tot_phases;
    ret = phase_color[phase];
    if(t > phase_t_end[phase] - transition_t[phase]){
      float lerp = map(t - phase_t_end[phase], -transition_t[phase], 0, 0, 1);
      float red, green, blue;
      red = lerp*(red(phase_color[next_phase]) - red(phase_color[phase])) + red(phase_color[phase]);
      green = lerp*(green(phase_color[next_phase]) - green(phase_color[phase]))+green(phase_color[phase]);
      blue = lerp*(blue(phase_color[next_phase]) - blue(phase_color[phase])) + blue(phase_color[phase]);
      ret = color(red, green, blue);
    }
    return ret;
    
  }

  color daylight(float x, float a, float b)
  {
    float ra, rb, rc, rd;
    float ga, gb, gc, gd;
    float ba, bb, bc, bd;

    ra = 0.462963;
    rb = -2.18651;
    rc = 50.6283;
    rd = -5.38889;

    ga = 1;
    gb = -7.14286;
    gc = 35.5714;
    gd = 129.174;

    ba = -0.2407;
    bb = 1.55556;
    bc = 1.20899;
    bd = 240.079;

    x = map(x, a, b, 0, 5);

    return color(ra*x*x*x+rb*x*x+rc*x+rd, ga*x*x*x+gb*x*x+gc*x+gd, ba*x*x*x+bb*x*x+bc*x+bd);
  }

  color sunset(float x, float a, float b)
  {
    float ra, rb, rc, rd;
    float ga, gb, gc, gd;
    float ba, bb, bc, bd;

    ra = -3.09252;
    rb = 22.4802;
    rc = -0.482804;
    rd = 81.2778;

    ga = 3.26852;
    gb = -13.1746;
    gc = 15.7394;
    gd = 43.5159;

    ba = 5.25926;
    bb = -38.4087;
    bc = 58.2447;
    bd = 92.5794;

    x = map(x, a, b, 0, 5);

    return color(ra*x*x*x+rb*x*x+rc*x+rd, ga*x*x*x+gb*x*x+gc*x+gd, ba*x*x*x+bb*x*x+bc*x+bd);
  }
    color night_sky(float x, float a, float b)
  {
    float ra, rb, rc, rd;
    float ga, gb, gc, gd;
    float ba, bb, bc, bd;

    ra = 1/3.;
    rb = -22;
    rc = 2/3.*100;
    rd = 12;

    ga = -4/3.;
    gb = 6;
    gc = 15 + 1/3.;
    gd = 20;

    ba = -9.16667;
    bb = 41;
    bc = -8.83333;
    bd = 69;

    x = map(x, a, b, 0, 3);

    return color(ra*x*x*x+rb*x*x+rc*x+rd, ga*x*x*x+gb*x*x+gc*x+gd, ba*x*x*x+bb*x*x+bc*x+bd);
  }
}
