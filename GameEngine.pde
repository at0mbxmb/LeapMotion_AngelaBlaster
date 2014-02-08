
class GameEngine {

  int numAngelas = 50;
  Angela[] angelas = new Angela[numAngelas];
  int timer = 0;

  void init() {
    for (int i=0; i < numBullets; i++)
      bullets[i] = new Bullet (width/2, 0); 
  
    for (int i=0; i < numAngelas; i++) {
      angelas[i] = new Angela ((i% 10) * 50 + 25, i / 10 * 50 + 30, 1);
    }
  }
  
  void showCharacters() { 
    background (0);
    
    // show all of the Angelas
    for (int i=0; i < numAngelas; i++) {
      angelas[i].draw();
    }
    
    // animate the Angelas 
    for (int i=0; i < numAngelas; i++) {
      angelas[i].xmove();
      if ((timer % 100) < 15) { 
        angelas[i].ymove();
      }
    }
    timer++;
     
    // show Michelle wherever the Leap senses your hand to be
    michelle.draw();
      for (Hand hand : leap.getHands()) {
        //hand.draw();
        michelle.x = (int)hand.getPosition().x;
      }

    // animate the bullets flying
    for (int i=0; i < numBullets; i++) {
      bullets[i].fly();
      bullets[i].draw();
    }
  }  
  
  void evaluateScore() {    
    // if no life left in the angelas, you win.
    int sum = 0;
    for (int i = 0; i < numAngelas; i++) {
      sum += angelas[i].life;
    } 
    if (sum == 0) win(); 
    
    // if any of the Angelas stay alive long enough to reach Michelle, you lose.
    for (int i=0; i < numAngelas; i++) {
      if (angelas[i].life != 0 && angelas[i].y > height-10) game.gameover();
    }  
  
  }
  
  void determineHit() {
    // if bullet hits angela, angela and bullet are both destroyed
    for (int i = 0; i < numAngelas; i++) {
      for (int j = 0; j < numBullets; j++) {
        if (bullets[j].x > angelas[i].x - 25 && bullets[j].x < angelas[i].x + 25 
        &&  bullets[j].y > angelas[i].y - 20 && bullets[j].y < angelas[i].y + 20 
        &&  bullets[j].life != 0 && angelas[i].life != 0) {
          angelas[i].life -= 1;
          bullets[j].life -= 1;
        }
      }
    }
  }
  
  void gameover() {
    fill (255, 0, 0);
    textSize(30);
    textAlign(CENTER);
    text ("Angela has conquered your planet!", width/2, height/2);
  }
  
  void win() {
    fill (0, 0, 255);
    textSize(30);
    textAlign(CENTER);
    text ("Hooray! You destroyed Angela!", width/2, height/2+50);
  }
}

