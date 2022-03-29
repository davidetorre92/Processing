PVector[] liners;
float r;
float theta;
color c = color(244, 11, 11);
color bkg = color(212, 1);
int i_center;

void setup() {
  size(500, 500);
  liners = new PVector[5];
  float r = 50;
  liners[0] = new PVector(0, 0);
  liners[1] = new PVector(r, 0);
  liners[2] = new PVector(2*r, 0);
  liners[3] = new PVector(-r, 0);
  liners[4] = new PVector(-2*r, 0);
  theta = 0.;
  background(bkg);
  noStroke();
  i_center = 0;
}

void draw() {
  //fill(bkg);
  //rect(0,0,width,height);
  float dtheta = HALF_PI*0.01;
  final float theta_star = HALF_PI;
  final int frameChange = (int)(theta_star / dtheta);
  final int n = liners.length;
  translate(width/2, height/2);
  dtheta *= 2*(i_center%2)-1;
  i_center = (frameCount % frameChange == 0) ? (i_center + 1) % n : i_center;
  theta = (frameCount % frameChange != 0) ? theta + dtheta : (PI + theta);
  fill(c);
  ellipse(liners[i_center].x, liners[i_center].y, 3, 3);
  for (int i = i_center+1; i < n + i_center; i++)
  {
    ellipse(liners[i%n].x, liners[i%n].y, 3, 3);
    float dist = PVector.dist(liners[i%n], liners[i_center]);
    liners[i%n].x = dist*cos(theta) + liners[i_center].x;
    liners[i%n].y = dist*sin(theta) + liners[i_center].y;
  }
  println(frameChange, i_center, theta, dtheta);
}
