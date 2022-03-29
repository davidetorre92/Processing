class Pippo{

  VectorialField vf;
  float T = 1;
  Pippo(){
    vf = new VectorialField(nrow, ncol); 
  }

  void vai(){
    vf.display();
    
    vf.update(frameCount/T);
  }

}
