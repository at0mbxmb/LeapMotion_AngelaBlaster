
class Bullet {
  int x;
  int y;
  int speed = 5;
  int life = 1;

  Bullet (int x, int y) {
    this.x = x;
    this.y = y;
  }
   
  void fly() {
    y -= speed;
  }
  
  void draw() {
    if (life != 0) {
      noStroke();
      fill (255, 0, 0);
      ellipseMode(CENTER);
      ellipse(x, y, 15, 20);
    }
  }
}
