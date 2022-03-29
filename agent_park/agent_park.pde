ArrayList<Vehicle> vehicles;
int Ngroups;
int socialDistance;
float invT;
int movers;

float maxCapacity;

void setup() {
  size(500, 500);
  Ngroups = 500;
  socialDistance = 15;
  vehicles = new ArrayList<Vehicle> ();
  maxCapacity = (2*sqrt(width*height)*socialDistance+width*height+socialDistance*socialDistance)/(socialDistance*socialDistance);
  int i = 0;
  for (int n = 0; n < Ngroups; n++) {
    vehicles.add(new Vehicle(random(width), random(height), i, n, socialDistance, null));
    Vehicle leader=vehicles.get(vehicles.size() - 1);
    i++;
    for (int g = 1; g < random(3); g++) {
      float angle = random(TWO_PI);
      vehicles.add(new Vehicle(leader.pos.x + socialDistance*0.5*cos(angle), leader.pos.y + socialDistance*0.5*sin(angle), i, n, socialDistance, leader));
      i++;
    }
  }
  invT = 0.75;
  for (Vehicle v : vehicles) {
    v.checkMating(vehicles);
  }
  for (Vehicle v : vehicles) {
    v.leadership();
  }
}

boolean upd = true;

void draw() {
  background(244);
  movers = 0;
  for (Vehicle v : vehicles) {
    v.display();
    v.behave(vehicles);
    v.update();
  }
  //saveFrame("frame####.png");
  
}

//RANDOM JUMP TEST

void keyPressed() {
  for (Vehicle v : vehicles) {
    while (random(1)<invT && v.move) {
      for (int friend : v.friends) {
        if (random(1)<0.5) {
          v.pos.x = vehicles.get(friend).pos.x + socialDistance*0.5;
          v.pos.y = vehicles.get(friend).pos.y;
          v.move = false;
          vehicles.get(friend).move=false;
          break;
        }
      }
      if (v.move) v.pos = new PVector(random(width), random(height));
    }
  }
  for (Vehicle v : vehicles) {
    v.move = true;
  }
}
