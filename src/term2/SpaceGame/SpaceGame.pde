// Space Game | Sean Gandre | 3A
import processing.sound.*;
SoundFile laser;

Spaceship s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powerups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level, rockRate;
boolean play;
Timer rTime, puTime;

void setup() {
  size(600, 600);
  s1 = new Spaceship();
  score = 0;
  level = 1;
  play = false;
  rockRate = 1000;
  rTime = new Timer(rockRate);
  rTime.start();
  puTime = new Timer(10000);
  puTime.start();
  laser = new SoundFile(this, "laser.wav");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(0);
    if (frameCount % 1000 == 0) {
      level++;
      rockRate -= 200;
      rTime.totalTime -= 100;
    }
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }
    infoPanel();


    if (puTime.isFinished()) {
      powerups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powerups.size(); i++) {
      Powerup pu = powerups.get(i);
      pu.display();
      pu.move();
      if (pu.intersect(s1) && pu.type == 'H') {
        //remove powerup
        powerups.remove(pu);
        // heal
        s1.health += 20;
      } else if (pu.intersect(s1) && pu.type == 'A') {
        s1.laserCount += 100;
        powerups.remove(pu);
      } else if (pu.intersect(s1) && pu.type == 'L') {
        s1.turretCount += 1;
        powerups.remove(pu);
      }

      if (pu.reachedBottom()) {
        powerups.remove(pu);
      }
    }
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          rock.diam -= 20;
          if (rock.diam <10) {
            rocks.remove(rock);
          }
          score += 20;
          lasers.remove(laser);
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }





    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    s1.display();
    s1.move(mouseX, mouseY);
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        //deduct 10hp
        s1.health -= 10;
        //dedduct 10 points
        score -= 10;
        //delete the rock
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
      }
      if (s1.health <1) {
        gameOver();
        noLoop();
      }
    }
  }
}

void infoPanel() {
  fill(127, 127);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  textSize(25);
  fill(255);
  text("Score:"+ score, 20, 36);
  text("Health:"+ s1.health, 150, 36);
  text("Level:"+ level, 300, 36);
  text("Ammo:"+ s1.laserCount, 450, 36);
}

void startScreen() {
  background(127);
  fill(0);
  textMode(LEFT);
  textSize(40);
  text("Welcome to Space Game!", 20, 300);
  text("Made by Sean Gandre", 20, 200);
  text("Please click to start", 20, 100);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(127);
  fill(0);
  textMode(CENTER);
  textSize(40);
  text("Game Over", 20, 300);
  text("Score:"+ score, 20, 250);
  text("Level:"+ level, 20, 200);
}

void ticker() {
}

void keyPressed() {
  if (!laser.isPlaying()) {
    laser.play();
    if (key == ' ' && s1.fire() && s1.turretCount == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      s1.laserCount -= 1;
    } else if (key == ' ' && s1.fire() && s1.turretCount == 2) {
      lasers.add(new Laser(s1.x-10, s1.y));
      lasers.add(new Laser(s1.x+10, s1.y));
      s1.laserCount -= 2;
    } else if (key == ' ' && s1.fire() && s1.turretCount > 2) {
      lasers.add(new Laser(s1.x-10, s1.y));
      lasers.add(new Laser(s1.x+10, s1.y));
      s1.laserCount -= 2;
    }
  }
}
void mousePressed() {
  if (!laser.isPlaying()) {
    laser.play();
    if (s1.fire() && s1.turretCount == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      s1.laserCount -= 1;
    } else if (s1.fire() && s1.turretCount == 2) {
      lasers.add(new Laser(s1.x-10, s1.y));
      lasers.add(new Laser(s1.x+10, s1.y));
      s1.laserCount -= 2;
    } else if (s1.fire() && s1.turretCount > 2) {
      lasers.add(new Laser(s1.x-10, s1.y));
      lasers.add(new Laser(s1.x+10, s1.y));
      s1.laserCount -= 2;
    }
  }
}
