
//sorry...wo zuo bu wan QAQ

PImage backgroungImg, soilImg, lifeImg, soldierImg ,titleImg, cabbageImg;
PImage groundhogIdle, groundhogLeft, groundhogRight, groundhogDown;
PImage startNormalImg, startHoveredImg;
float soldierX, soldierY, soilFloor,soldierRight,soldierBottom;
int groundhogX, groundhogY, groundhogR, groundhogBottom;
int  groundhogSpeed;
float cabbageX, cabbageY;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
final int GAME_WIN = 3;
final int BUTTON_TOP=360;
final int BUTTON_BOTTOM=420;
final int BUTTON_LEFT=248;
final int BUTTON_RIGHT=392;
int gameState = GAME_START;


void setup() {
  size(640, 480, P2D);
  backgroungImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  lifeImg = loadImage("img/life.png");
  soldierImg = loadImage("img/soldier.png");
  groundhogIdle = loadImage("img/groundhogIdle.png");
  groundhogLeft = loadImage("img/groundhogLeft.png");
  groundhogRight = loadImage("img/groundhogRight.png");
  groundhogDown = loadImage("img/groundhogDown.png");
  titleImg = loadImage("img/title.jpg");
  cabbageImg = loadImage("img/cabbage.png");
  startNormalImg = loadImage("img/startNormal.png");
  startHoveredImg = loadImage("img/startHovered.png");
  groundhogX = width/2;
  groundhogY = 80;
  groundhogR = groundhogX+80;
  groundhogBottom = groundhogY+80;
  soldierBottom = soldierY+80;
  groundhogSpeed =1 ;
  soilFloor = 80;
  soldierY=floor(random(2, 6))*soilFloor;
  cabbageX=floor(random(0, 7))*soilFloor;
  cabbageY=floor(random(2, 5))*soilFloor;
  soldierRight = soldierX+80;
  soldierX = -80;
}

void draw() {
  // Switch Game State
   switch(gameState){
   case GAME_START: 
   if(mouseX > BUTTON_LEFT && mouseX < BUTTON_RIGHT
     && mouseY > BUTTON_TOP && mouseY < BUTTON_BOTTOM){
   image(startNormalImg,0,0);
   if(mousePressed){
   gameState = GAME_RUN;
   }
  }else{
    image(titleImg, 0, 0);
   }
   break;
// Game Start

  // Game Run
   case GAME_RUN:    
  if(groundhogX < soldierRight && groundhogR > soldierX
  && groundhogY < soldierBottom && groundhogBottom > soldierRight){
    groundhogX=320;
    groundhogY=80;
  }
  break;
   }
  //background
  image(backgroungImg, 0, 0);
  image(soilImg, 0, 160);
  image(lifeImg, 10, 10);
  image(lifeImg, 80, 10);
  //image(lifeImg, 150, 10);
  //grass
  rectMode(CORNER);
  fill(124, 204, 25);
  noStroke();
  rect(0, 145, 640, 15);
  //sun
  strokeWeight(5);
  stroke(255, 255, 0);
  fill(253, 184, 19);
  ellipse(590, 50, 120, 120);  
  //cabbage
  image(cabbageImg,cabbageX,cabbageY);

  
  //soldier
  soldierX= soldierX + 5;
  if(soldierX>=640)soldierX=-80;  

  imageMode(CORNERS);
  image(soldierImg, soldierX, soldierY);
  //grounghog
  imageMode(CORNERS);
  image(groundhogIdle, groundhogX, groundhogY);
  if (groundhogX <0) groundhogX=0;
  if (groundhogX > 560) groundhogX=560;
  if (groundhogY > 400) groundhogY=400;

}
  
  //touch soldier
  // Game Lose



void keyPressed() {
  if (key == CODED) { 
    switch (keyCode) {
    case DOWN:
      downPressed = true;
      groundhogY=groundhogY+80;
      break;
    case LEFT:
      leftPressed = true;
      groundhogX=groundhogX-80;
      break;
    case RIGHT:
      rightPressed = true;
      groundhogX=groundhogX+80;
      break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
    case DOWN:
      downPressed = false;
      
      break;
    case LEFT:
      leftPressed = false;
      break;
    case RIGHT:
      rightPressed = false;
      break;
    }
  }
}
