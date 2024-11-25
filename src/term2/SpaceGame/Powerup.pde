class Powerup {
  int x, y, diam, speed;
  char type;
  PImage p1, p2, p3;

  //Constructor
  Powerup() {
    x = int(random(width));
    y = -100;
    diam = int(random(80, 80));
    speed = int(random(2, 5));
    int rand = int(random(3));
    if (rand == 0) {
      type = 'H';
      p1 = loadImage("Medic01.png");
      p1.resize(diam, diam);
      imageMode(CENTER);
    } else if (rand == 1) {
      type = 'L';
    } else if (rand == 2) {
      type = 'A';
      p2 = loadImage("Ammo.png");
      p2.resize(diam,diam);
      imageMode(CENTER);
    }
  }

  void display() {
    if (type == 'H') {
      image(p1, x, y);
    } else if (type == 'L') {
      fill(255, 0, 0);
      ellipse(x, y, 30, 30);
    } else if (type == 'A') {
      image(p2,x,y);
    }
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }


  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d < 50) {
      return true;
    } else {
      return false;
    }
  }
}
