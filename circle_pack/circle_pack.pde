int N, N_colors, sw;
float R_ext;
float growth_speed;
color[] circle_color;
Circle[] circles;

void setup() {
  size(1500, 1500);
  R_ext = 200*3;
  N = 2000;
  N_colors = 100;
  sw = 2*3;
  growth_speed = 1.;

  init_circles();
  noFill();
  strokeWeight(sw);
}

void draw() {
  background(244);
  for (int i=0; i<N; i++) {
    circles[i].show();
    //print("i=", i, ":");
    Circle[] check_list = new Circle[N-1];
    int j=0;
    int k=0;
    do{
      if(k!=i){
        //print(" ",k);
        check_list[j]=circles[k];
        j++;
      }
    k++;
    }while(j<N-1);
    if(circles[i].check_and_update(check_list) && circles[i].constr()) circles[i].r += growth_speed;
  }
  saveFrame("output/two.png");
}

void init_circles() {
  int i = 0;
  float R_ext_sq = R_ext*R_ext;

  circles = new Circle[N];

  do {
    float x = random(-R_ext, R_ext);
    float y = random(-R_ext, R_ext);
    if (x*x+y*y<R_ext_sq) {
      circles[i] = new Circle(x+width*0.5, y+height*0.5, 0.);
      i++;
    }
  } while (i<N);
}
