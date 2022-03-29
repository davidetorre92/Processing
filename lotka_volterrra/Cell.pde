class Cell {
  int x, y, xs, ys, i;
  boolean fox, rabbit;  
  float pB, pA, d;      
  Cell(int x_, int y_, int xs_, int ys_, int i_) {
    x = x_;
    y = y_;
    xs = xs_;
    ys = ys_;
    i = i_;
    fox = getTheAnimal(0.1);
    rabbit = getTheAnimal(0.1);
    pB=1;
    pA=1;
    d=1;
  }
  
  boolean getTheAnimal(float p){
    return (random(1)<p)?(true):(false);
  }

  void show() {
    setGridFill(fox, rabbit);
    noStroke();
    rect(x, y, x+xs, y+ys);
  }

  void update() {
    if (rabbit && fox) {
      rabbitStrugglesForItsLife();
      return;
    }
    if (!rabbit && fox) {
      foxStrugglesForItsLife();
      return;
    }
    if (rabbit && !fox) {
      rabbitDisplaces();
      return;
    }
    if (!rabbit && !fox) {
      rabbitDoesHardcore();
      return;
    }
  }

  void rabbitDoesHardcore() {
    if (random(1)<pA) {
      rabbit=true;
    }
  }

  void rabbitDisplaces() {
    int iR;
    int xy, ab;
    ab = int(random(2))*2-1;
    xy = int(random(2))*2;
    iR = i+(width/xs*xy)*ab+(1-xy)*ab;
    if (iR<n && iR >=0) {
      if (cells[iR].rabbit) {
        return;
      } else {
        cells[iR].rabbit=true;
        rabbit = false;
      }
    }
    return;
  }

  void foxDisplaces() {
    int iF;
    int xy, ab;
    ab = int(random(2))*2-1;
    xy = int(random(2));
    iF = i+(width/xs*xy)*ab+(1-xy)*ab;
    if (iF<n && iF >=0) {
      if (cells[iF].fox) {
        return;
      } else {
        cells[iF].fox=true;
        fox = false;
      }
    }
    return;
  }


  void foxStrugglesForItsLife() {
    if (random(1)<d) {
      fox = false;
      return;
    } else {
      foxDisplaces();
    }
  }

  void rabbitStrugglesForItsLife() {
    if (random(1)<pB) {
      rabbit=false;
      int iF;
      do{
        iF = int(random(n));
      } while (cells[iF].fox);
      cells[iF].fox=true;
      
    } else {
      rabbitDisplaces();
      foxDisplaces();
    }
  }
}

void setGridFill(boolean f, boolean r) {
  if (!f && !r) {
    fill(244);
    return;
  }
  if (f && !r) {
    fill(244, 122, 0);
    return;
  }
  if (!f && r) {
    fill(0, 244, 244);
    return;
  }
  if (f && r) {
    fill(244, 0, 0);
    return;
  }
}
