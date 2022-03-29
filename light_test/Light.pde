void light_line(float xs, float ys, float xe, float ye, color stroke, float weight, float light)
{
  int haloMax = 4;
  strokeCap(ROUND);
  strokeWeight(weight);
  stroke(stroke);
  line(xs, ys, xe, ye);
  for(int halo = 1; halo <= haloMax; halo++)
  {
  float mark_x = (xe - xs) * (halo * light);
  float mark_y = (ye - ys) * (halo * light);
  weight = weight * (1 + halo * light);
  strokeWeight(weight);
  stroke(stroke, (255 - 255./(haloMax + 1) * halo)*light);
  line(xs-mark_x, ys-mark_y, xe+mark_x, ye+mark_y);
  }
}
