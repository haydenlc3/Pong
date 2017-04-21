PFont font1, font2;

int controller=50;
int x,y,score=0;
int changeX=-8;
int changeY=-8;
int gameOver=0;

class StopWatchTimer {
  int startTime = 0, stopTime = 0;
  boolean running = false;   
    void start() {
        startTime = millis();
        running = true;
    }
    void stop() {
        stopTime = millis();
        running = false;
    }
    int getElapsedTime() {
        int elapsed;
        if (running) {
             elapsed = (millis() - startTime);
        }
        else {
            elapsed = (stopTime - startTime);
        }
        return elapsed;
    }
    int second() {
      return (getElapsedTime() / 1000) % 60;
    }
}

StopWatchTimer sw = new StopWatchTimer();

void setup(){
  size(800, 600);
  x=(int)random(width);
  y=height-controller;
  font1 = loadFont("CourierStd-48.vlw");
  font2 = loadFont("CourierStd-36.vlw");
  sw.start();
}

void draw(){
    if(gameOver==0){
      background(loadImage("space.jpg"));
      text("SCORE:"+score,(width/2)-100,30);
      text("TIME:"+sw.second(),(width/2)-100,60);
      textFont(font1);
      fill(39, 165, 46);
      rect(mouseX,height-controller,100,controller);
      ellipse(x,y,20,20);
      x+=changeX;
      y+=changeY;
      if(x<0 | x>width){
        changeX=-changeX;
      }
      if(y<0){
        changeY=-changeY;
      }
      if(y>height-controller){
        if(x>mouseX && x<mouseX+200){
          changeY=-changeY;
          score++;
        }
        else{
          restart();
        }
      }
    }
    else{
      sw.stop();
      background(0);
      text("GAME OVER: Your score was "+score,(width/2)-300,30);
      text("CLICK TO RESTART",(width/2)-170,200);
      textFont(font2);
  }
}

void restart(){
  gameOver=1;
}

void mouseClicked(){
  changeY=-changeY;
  score=0;
  gameOver=0;
  sw.start();
}