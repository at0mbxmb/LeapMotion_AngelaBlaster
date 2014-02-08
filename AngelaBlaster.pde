import de.voidplus.leapmotion.*;

LeapMotion leap;
GameEngine game;
Bullet[] bullets;
Michelle michelle;
int numBullets = 500;
int bullet = 0;

void setup() {
  size (600, 450);
  leap = new LeapMotion(this).withGestures("key_tap");
  game = new GameEngine();
  bullets = new Bullet[numBullets];
  michelle = new Michelle(5);
  
  game.init();
}
 
void draw() {
  game.showCharacters();
  game.determineHit();
  game.evaluateScore();
}
 
 // TODO: move this out of the main client
void leapOnKeyTapGesture(KeyTapGesture g){
  int       id               = g.getId();
  Finger    finger           = g.getFinger();
  PVector   position         = g.getPosition();
  PVector   direction        = g.getDirection();
  long      duration         = g.getDuration();
  float     duration_seconds = g.getDurationInSeconds();
  
  bullets[bullet] = new Bullet (michelle.x, michelle.y);
  bullet++;
}

