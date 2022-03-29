class VectorialField{
  int n, nrow, ncol;
  ArrayList<Vector> field;
  
  VectorialField(int nrow_, int ncol_){
    nrow = nrow_;
    ncol = ncol_;
    n = ncol * nrow;
    field = new ArrayList<Vector>();
    _init_field();
  }
  void display(){
    for(Vector v : field){
      v.display();
    }
  }
  void update(float z){
    for(Vector v : field){
      v.update(z);
    }
  }
  void _init_field(){
    float dx = width/(ncol+0.);
    float dy = height/(nrow+0.);
    for(float x = 0.; x < width; x += dx){
      for(float y = 0.; y < height; y += dy){
        field.add(new Vector(x, y));      
      }
    }
  }
}
