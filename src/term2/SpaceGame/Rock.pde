class Rock {
  int x, y, diam, speed;
  PImage r1;

  //Constructor
  Rock() {
    x = int(random(width));
    y = -100;
    diam = int(random(40, 80));
    speed = int(random(2, 5));
    r1 = loadImage("Rock01.png");
  }

  void display() {
    imageMode(CENTER);
    r1.resize(diam, diam);
    image(r1, x, y);
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
}
