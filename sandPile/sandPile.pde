int[] avalanche;
int[] grid;
int avalancheSize = 0;
void setup() {
  size(500, 500);
  loadPixels();
  frameRate(30);
  grid = new int[width*height];
  avalanche = new int[width*height];
  for (int i = 0; i < width*height; i++) {
    grid[i]=0;
    pixels[i]=getColor(grid[i]);
    if (random(1)<0.01) {
      avalanche[avalancheSize] = i;
      avalancheSize++;
      grid[i]=320;
    }
  }  
  final int seedInd = height/2*width+width/2;
  avalanche[avalancheSize] = seedInd;
  avalancheSize++;
  grid[seedInd]=1000;
  pixels[seedInd]=getColor(grid[seedInd]);
}

void draw() {
  updatePixels();
  //println("DEBUG: ");
  for (int i=0; i < avalancheSize; i++) {
    int p = avalanche[i];
    //println(" "+p+": "+grid[p]);
    if (grid[p]>=4) {
      grid[p]-=4;
      if (grid[p]<4) {
        for (int j=i+1; j<avalancheSize; j++) {
          avalanche[j-1]=avalanche[j];
        }
        i--;
        avalancheSize--;
      }
      int n=p-width;
      if (n>=0) {
        grid[n]++;
        pixels[n]=getColor(grid[n]);
        if (grid[n]>=4) {
          boolean in = false;
          for (int j=0; j<avalancheSize; j++) {
            if (avalanche[j]==n) {
              in = true;
              break;
            };
          }
          if (!in) {
            avalancheSize++;
            avalanche[avalancheSize-1]=n;
          }
        }
      }
      int s = p+width;
      if (s<width*height) {
        grid[s]++;
        pixels[s]=getColor(grid[s]);
        if (grid[s]>=4) {
          boolean in = false;
          for (int j=0; j<avalancheSize; j++) {
            if (avalanche[j]==s) {
              in = true;
              break;
            };
          }
          if (!in) {
            avalancheSize++;
            avalanche[avalancheSize-1]=s;
          }
        }
      }
      int w = p-1;
      if (int(p/width)==int(w/width) && w>0) {
        grid[w]++;
        pixels[w]=getColor(grid[w]);
        if (grid[w]>=4) {
          boolean in = false;
          for (int j=0; j<avalancheSize; j++) {
            if (avalanche[j]==w) {
              in = true;
              break;
            };
          }
          if (!in) {
            avalancheSize++;
            avalanche[avalancheSize-1]=w;
          }
        }
      }
      int e = p+1;
      if (int(p/width)==int(e/width)) {
        grid[e]++;
        pixels[e]=getColor(grid[e]);
        if (grid[e]>=4) {
          boolean in = false;
          for (int j=0; j<avalancheSize; j++) {
            if (avalanche[j]==e) {
              in = true;
              break;
            };
          }
          if (!in) {
            avalancheSize++;
            avalanche[avalancheSize-1]=e;
          }
        }
      }
    } else {
      pixels[p]=getColor(grid[p]);
    }
  }
}

color getColor(int grid) {
  switch(grid) {
  case 0:
    return color(239, 233, 244);
  case 1:
    return color(102, 153, 155);
  case 2:
    return color(73, 106, 129);
  case 3:
    return color(43, 58, 103);
  }
  return color(11);
}
