final int ONE_BLOCK = 80;
final int SOIL_H = 320;
final int SUN_W = 120;
final int SUN_D = 50; //Distance from center to boundary
final int GRASS_H = 15; //Grass thickness

final int LIFE_W = 50;
final int LIFE_H = 50;
final int LIFE_D = 20; //Distance between life

final int GROUNDHOG_W = 80;
final int GROUNDHOG_H = 80;

final int SOLDIER_W = 80;
final int SOLDIER_H = 80;

final int ROBOT_W = 80;
final int ROBOT_H = 80;
final int LASER_H = 10;

PImage bgImg, groundhog, life, robot, soil, soldier;

float groundhogX, groundhogY;
float soldierX, soldierY, soldierSpeed;
float robotX, robotY;
float laserX, laserY, laserSpeed, laserW, laserMaxW;

void setup() {
  size(640, 480, P2D);
  // Enter Your Setup Code Here
  bgImg = loadImage("img/bg.jpg");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  
  groundhogX = width/2 - GROUNDHOG_W/2;
  groundhogY = ONE_BLOCK;
  
  soldierX = 0;
  soldierY = floor(random(4))*ONE_BLOCK + ONE_BLOCK*2;
  soldierSpeed = 1;
  
  robotX = floor(random(2,8))*ONE_BLOCK;
  robotY = floor(random(4))*ONE_BLOCK + ONE_BLOCK*2;
  
  laserSpeed = 2;
  laserW = 0;
  laserMaxW = 40;
  laserX = robotX + 25;
  laserY = robotY + 37;
}

void draw() {
  // Enter Your Code Here
  image(bgImg, 0, 0, width, height);
  image(soil, 0, ONE_BLOCK*2, width, SOIL_H);
  
  //life
  image(life, LIFE_D/2, LIFE_D/2, LIFE_W, LIFE_H);
  image(life, LIFE_D*4, LIFE_D/2, LIFE_W, LIFE_H);
  image(life, LIFE_D/2 + LIFE_D*7, LIFE_D/2, LIFE_W, LIFE_H);
  
  //sun
  strokeWeight(5);
  stroke(255, 255, 0);
  fill(253, 184, 19);
  ellipse(width - SUN_D, SUN_D, SUN_W, SUN_W);
  
  //grass
  noStroke();
  fill(124, 204, 25);
  rect(0, ONE_BLOCK*2 - GRASS_H, width, GRASS_H);
  
  //groundhog
  image(groundhog, groundhogX, groundhogY, GROUNDHOG_W, GROUNDHOG_H);
  
  //robot: laser
  noStroke();
  fill(255, 0, 0);
  rect(laserX, laserY, laserW, LASER_H, 5);
    
  if(laserW <= laserMaxW){
    laserW += laserSpeed;
  }
  if(laserX > robotX - ONE_BLOCK*2){
    laserX -= laserSpeed;
  }else{
    laserX = robotX + 25;
    laserY = robotY + 37;
    laserW = 0;
    laserW += laserSpeed;
  }
  
  //robot
  image(robot, robotX, robotY, ROBOT_W, ROBOT_H);
  
  //soldier
  soldierX += soldierSpeed;
  soldierX %= (width+SOLDIER_W);
  image(soldier, soldierX-SOLDIER_W, soldierY, SOLDIER_W, SOLDIER_H);
}
