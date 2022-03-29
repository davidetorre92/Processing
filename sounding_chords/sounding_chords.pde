import processing.sound.*;
TriOsc[] triangle;
int[] exponents = { 1, 4, 7, 11, 14, 18, 21, 25 };

void setup() {
  size(640, 360);
  background(255);

  // Create the triangle oscillator
  triangle = new TriOsc[8];
  for (int i = 0; i < 8; i++)
  {
    triangle[i] = new TriOsc(this);
  }
}

void draw() {
  float tonic = 110;
  for(int i = 0; i < 8; i++)
  {
    triangle[i].play(tonic * pow(2, exponents[i]/12.), noise(cos(frameCount/(2*frameRate+0.)*TWO_PI) + exponents[i])*0.1);
  }
}
