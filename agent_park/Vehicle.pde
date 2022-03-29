class Vehicle {
  PVector pos, vel, acc;
  float maxSpeed;                 //Testare per renderlo rigido FATTO!
  float maxForce;                 //Testare per renderlo rigido FATTO!
  int id, group_id;
  float restFactor;               
  int socialDistance;
  IntList friends;
  color cl = color(11);
  Vehicle leader;

  boolean isLeader;
  boolean move;
  Vehicle(float x_, float y_, int id_, int groupid_, int sD, Vehicle leader_) {
    pos = new PVector(x_, y_);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    id = id_;
    maxSpeed = 1.5; //unit: pixels/frame?
    maxForce = 1.0; //unit: m = 1 -> pixels/(frame**2)
    socialDistance = sD; //unit: pixels
    restFactor = 0.0;
    leader = leader_;
    group_id = groupid_;

    friends = new IntList();
    int howManyfriends = int(random(0.9));
    while (friends.size() < howManyfriends) {
      int friend_id = int(random(Ngroups));
      addFriend(friend_id);
    }

    //fatigue=0;
    //fatigueMax=100;
    //c=2;
    //r_co=250;
    //dspl=100;
    //freeSpot = null;
    //restTime=0;
    if (leader==null) {
      isLeader = true;
      cl = color(244, 0, 0);
    } else {
      isLeader = false;
      cl = color(11);
    }
  }
  void behave(ArrayList<Vehicle> others) {

    //B1: Respecting social distancing;

    separate(others);

    //B2: leader mating

    stroke(11, 128);
    if (leader!=null) {
      line(pos.x, pos.y, leader.pos.x, leader.pos.y);
      getCloseTheLeader();
    }

    ////B3: Recognize Friends
    //for (int f : friends) {
    //  PVector target = others.get(f).pos;
    //  stroke(11, 11);
    //  line(pos.x, pos.y, target.x, target.y);
    //}
  }

  void getCloseTheLeader() {

    PVector target = PVector.sub(leader.pos, pos);
    if (pos.dist(leader.pos) < 0.75*socialDistance) {
      return;
    }
    PVector desired = target.copy();
    //desired.setMag(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    //steer.setMag(maxForce*1.5);
    applyForce(steer);
    return;
  }

  void checkMating(ArrayList<Vehicle> others) {
    for (int friend : friends) {
      others.get(friend).addFriend(id);
      for (int my_friend : friends) {
        others.get(friend).addFriend(my_friend);
      }
    }
  }

  void seek(PVector target, float str) {
    PVector desired = PVector.sub(target, pos);
    float d = desired.mag();
    desired.normalize();
    if (d>socialDistance) {
      desired.mult(maxSpeed);
    } else {
      float m = map(d, 0, socialDistance, 0, maxSpeed);
      desired.mult(m);
    }
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    steer.mult(str);
    applyForce(steer);
  }

  void separate(ArrayList<Vehicle> others) {
    int cnt = 0;
    PVector sum = new PVector();
    for (Vehicle v : others) {
      boolean group;
      boolean friend = false;
      if (group_id == v.group_id) {
        group = true;
      } else {
        group = false;
      }
      for (int f : friends) {
        if (v.id == f) {
          friend = true;
          break;
        }
      }
      float desiredDistance = socialDistance;
      if (group) {
        desiredDistance*=1.85;
      }
      float d = pos.dist(v.pos);
      if (d>0 && d<desiredDistance) {
        cnt++;
        PVector diff = PVector.sub(pos, v.pos);
        diff.normalize();
        diff.div(d);
        sum.add(diff);
      }
    }
    if (cnt>0) {
      sum.div(cnt);
      sum.setMag(maxSpeed);
      PVector steer = PVector.sub(sum, vel);
      steer.setMag(maxForce);
      applyForce(steer);
      noFill();
      stroke(244, 0, 0, 128);
      ellipse(pos.x, pos.y, socialDistance*2, socialDistance*2);
      movers++;
    } else {
      noFill();
      stroke(11, 128);
      ellipse(pos.x, pos.y, socialDistance*2, socialDistance*2);
      applyForce(new PVector(0,0));
    }
  }

  boolean addFriend(int otherID) {
    if (otherID == id) { 
      return false;
    }
    boolean linked = false;
    for (int friend : friends) {
      if (friend == otherID) {
        linked = true;
        break;
      }
    }
    if (!linked) {
      //color c = color(random(244), random(244), random(244));
      friends.append(otherID);
      // cl = c;
    }
    return true;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    vel.add(acc.limit(maxForce));
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
    vel.mult(restFactor);
    pos.x = constrain(pos.x, 0, width);
    pos.y = constrain(pos.y, 0, height);
  }

  void leadership() {
    isLeader = true;
    for (int friend : friends) {
      if (friend < id) {
        isLeader = false;
        break;
      }
    }
  }

  void display() {
    fill(cl);
    noStroke();
    ellipse(pos.x, pos.y, 5, 5);
  }
}
