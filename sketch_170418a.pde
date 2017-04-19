PFont font1, font2;

int controller=50;
int x,y,score=0;
int changeX=-8;
int changeY=-8;
int gameOver=0;

void setup(){
  size(800, 600);
  x=(int)random(width);
  y=height-controller;
  font1 = loadFont("CourierStd-48.vlw");
  font2 = loadFont("CourierStd-36.vlw");
}

void draw(){
    if(gameOver==0){
      background(0); 
      text("SCORE:"+score,(width/2)-100,30);
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
}