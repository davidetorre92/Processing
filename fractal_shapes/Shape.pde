class Shape {

  float xci, xcf, xc;
  float yci, ycf, yc;
  float sidei, sidef, side;
  Shape(float xci_, float yci_, float xcf_, float ycf_, float sidei_, float sidef_) {
    xci = xci_;
    yci = yci_;
    xcf = xcf_;
    ycf = ycf_;
    sidei = sidei_;
    sidef = sidef_;
    xc = xci;
    yc = yci;
    side = sidei;
  }

  void show() {
    noStroke();
    fill(11, 11, noise(xcf*0.02)*122+noise(ycf*0.02)*122);
    rectMode(CENTER);
    rect(xc, yc, side, side);
  }

  void update()
  {
    xc = lerp(xc, xcf, 0.1);
    yc = lerp(yc, ycf, 0.1);
    side = lerp(side, sidef, 0.1);
  }
  ArrayList<Shape> grow()
  {
    ArrayList<Shape> new_shapes = new ArrayList<Shape>();
    new_shapes.add(new Shape(xc, yc, xc + sidef/3., yc + sidef/3., side, sidef/3.));
    new_shapes.add(new Shape(xc, yc, xc - sidef/3., yc + sidef/3., side, sidef/3.));
    new_shapes.add(new Shape(xc, yc, xc, yc + sidef/3., side, sidef/3.));
    new_shapes.add(new Shape(xc, yc, xc - sidef/3., yc, side, sidef/3.));
    new_shapes.add(new Shape(xc, yc, xc + sidef/3., yc, side, sidef/3.));
    new_shapes.add(new Shape(xc, yc, xc - sidef/3., yc - sidef/3., side, sidef/3));
    new_shapes.add(new Shape(xc, yc, xc + sidef/3., yc - sidef/3., side, sidef/3));
    new_shapes.add(new Shape(xc, yc, xc, yc - sidef/3., side, sidef/3));
    return new_shapes;
  }
}
