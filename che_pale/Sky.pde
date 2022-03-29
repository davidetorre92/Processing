class Sky {
  public int n_stars;
  public float dist_threshold;
  public float hour;
  private PVector[] star_pos;
  public float star_radius = 3.;
  public Sky(int ns, float dt, float r) {
    n_stars = ns;
    dist_threshold = dt;
    star_radius = r;
    init_pos();
  }

  public void show() {
    show_sky();
    show_stars();
  }
  private void show_sky() {
    background(#4766FA);
  }

  private void show_stars() {
    color star_color = color(244);
    fill(star_color);
    noStroke();
    for(int i = 0; i < n_stars; i++){
      ellipse(star_pos[i].x, star_pos[i].y, star_radius, star_radius);
    }
  }

  private void init_pos() {
    star_pos = new PVector[n_stars];
    for (int i = 0; i < n_stars; i++) {
      star_pos[i] = new PVector(random(width), random(height));
      for (int j = 0; j < i; j++) {
        println(i, j);
        if (PVector.dist(star_pos[i], star_pos[j]) < dist_threshold) {
          i--;
          break;
        }
      }
    }
  }
}
