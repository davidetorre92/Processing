class Clock {
  float rate;
  int ticks;
  float T;
  Clock(float r) {
    rate = r;
    ticks = 0;
  }
  void update_ticks() {
    ticks++;
    T = ticks/rate;
  }
}
