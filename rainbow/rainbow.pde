LittleRainbow lr;

void setup(){
  size(500, 500);
  lr = new LittleRainbow(50,30);
}

void draw(){
  bkg();
  lr.show();
}

void bkg(){
  background(244);
  stroke(11);
  fill(11);
  ellipse(width/2, height/2, 400, 400);
}
