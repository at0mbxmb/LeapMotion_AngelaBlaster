
class Angela {
  PImage img;
  float x;
  float y;
  float xmoveRads = 1;
  float speed;
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
  
  void ymove() {
    y += 1;
  }
  
  void draw() {
    if (life !=0 ) {
      imageMode(CENTER);
      image(img, x, y);
    }
  }
}
