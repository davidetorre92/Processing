Pippo animation;
int nrow = 30;
int ncol = 30;

void setup() {
  size(500, 500);
  animation = new Pippo();
  noStroke();
}

void draw() {
  background(244);
  animation.vai();
}
