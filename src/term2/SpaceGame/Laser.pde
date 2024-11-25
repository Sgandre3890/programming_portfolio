class Laser {
  // Member variables
  int x, y, w, h, speed;
  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 8;
  }
  //Member meathods
  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    noStroke();
    rect(x, y, w, h);
  }

  void move() {
    y -= speed;
  }

  void fire() {
  }

  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
