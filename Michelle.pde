
class Michelle {
  PImage img;
  int x = width / 2;
  int y = height - 30;
  int speed;
   
  Michelle (int speed) {
    this.speed = speed;
    img = loadImage("me_guitar.png");
  }
   
  void draw() {
    imageMode(CENTER);
    image(img, x, y);   
  }
}
