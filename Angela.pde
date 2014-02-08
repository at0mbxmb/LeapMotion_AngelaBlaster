
class Angela {
  PImage img;
  float x;
  float y;
  float xmoveRads = 1;
  float speed;
  float step;
  int life;
  
  Angela (int x, int y, int life) {
    this.x = x;
    this.y = y;
    this.life = life;
    img = loadImage("angela.png");
  }
   
  void xmove() {
    speed = sin(radians(xmoveRads));
    x += speed;
    xmoveRads++;
  }
  void ymove(int step) {
    y += step;
  }
  void draw() {
    if (life !=0 ) {
      imageMode(CENTER);
      image(img, x, y);
    }
  }
}
