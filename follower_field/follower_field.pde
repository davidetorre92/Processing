Follower f[];
Engine e;
int nf, df;
int sp;
void setup() {
  size(500, 500);
  float x, y;
  x = 100;
  nf = 30;
  df = 2;
  f = new Follower[nf*df];
  sp = 100;
  for (int j = 0; j < df; j++)
  {
    y = random(height);
    x -= 200;
    for (int i = 0; i < nf; i++)
    {
      f[i+j*nf] = new Follower(x, y, map(i, 0, nf, -sp, sp));
    }
  }
  e = new Engine();
  background(11);
}

void draw()
{
  noStroke();
  fill(11,11);
  rect(0,0,width,height);
  e.run();
}
