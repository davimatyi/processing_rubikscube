import static java.awt.event.KeyEvent.*;

String[][][] sides = new String[6][3][3];
String[] colors = {"ffffffff", "ff00ff00", "ffff0000", "ff0000ff", "ffffa500", "ffffff00"};
//                     top        front       right       back        left        bottom
float rotationX = 0, rotationY = 0;
float prx = 0, pry = 0;
float mx = 0, my = 0;
int shuffleStepsLeft = 0;
int shuffleTimer = 0;

int random(int a, int b){return (int)(Math.random()*(b-a+1)+a);}


//----------------------------------------------------------------------------------------------

void setup(){
  size(1280, 720, P3D);
  stroke(0);
  rectMode(CENTER);
  textSize(40);
  
  resetCube();
  
}
//-----------------------------------------------------------------------------------------------
void draw(){
  
  if(shuffleStepsLeft > 0 && shuffleTimer % 5 == 0){
    shuffleStepsLeft--;
    switch(random(1,6)){
      case 1: ru();
      case 2: rf();
      case 3: rr();
      case 4: rb();
      case 5: rl();
      case 6: rd();
    }
  }
  if(shuffleTimer > 0) shuffleTimer--;
  
  pushMatrix();
  translate(width/2, height/2, -200);
  background(0);
  
  if(mousePressed == true){
    rotationX = prx + (my-mouseY)/height * PI * 2;
    rotationY = pry + (mouseX-mx)/width * PI * 2; 
    rotateX(rotationX);
    rotateY(rotationY);
  }else{
    rotateX(rotationX);
    rotateY(rotationY);
  }

  
  for(int side = 0; side < sides.length; side++){
    pushMatrix();
      settingRotation(side);
      translate(-100,-100,-150);
      for(int row = 0; row < sides[side].length; row++){
        for(int col = 0; col < sides[side][row].length; col++){
          fill(unhex(sides[side][row][col]));
          rect(0,0,100,100);
          translate(100,0,0);
        }
        translate(-300,100,0);
      }
    popMatrix();
  }
  
  popMatrix();
  pushMatrix();
    translate(10, 10, -400);
    rotateX(rotationX);
    rotateY(rotationY);
    for(int i = 0; i < 6; i++){
      pushMatrix();
        settingRotation(i);
        translate(0,0,-50);
        fill(255);
        rect(0,0,100,100);
        fill(0);
        printText(i);
      popMatrix();
    }
  popMatrix();
}


//--------------------------------------------------------------------------------------------


void keyPressed(){
  if(key == CODED){
    if(keyCode == VK_F1){
      resetCube();
    }
    if(keyCode == VK_F2){
      shuffleCube();
    }
  }
  if(key == '0') shuffleCube();
  if(key == '1') resetCube();
  if(key == 'u') ru();
  if(key == 'r') rr();
  if(key == 'f') rf();
  if(key == 'l') rl();
  if(key == 'd') rd();
  if(key == 'b') rb();
  
  if(key == 'U') {ru();ru();ru();}
  if(key == 'R') {rr();rr();rr();}
  if(key == 'F') {rf();rf();rf();}
  if(key == 'L') {rl();rl();rl();}
  if(key == 'D') {rd();rd();rd();}
  if(key == 'B') {rb();rb();rb();}
}

void mousePressed(){
  mx = mouseX;
  my = mouseY;
}
void mouseReleased(){
  prx = rotationX;
  pry = rotationY;
}

//--------------------------------------------------------------------------------------------------------

void settingRotation(int side){
  switch(side){
    case 0: rotateX(-PI/2); break;
    case 1: rotateY(PI); break;
    case 2: rotateY(-PI/2); break;
    case 3:  break;
    case 4: rotateY(PI/2); break;
    case 5: rotateX(PI/2); break;
  }
}

void printText(int side){
  switch(side){
    case 0: rotateZ(PI); translate(-10,5,-1); text("U",0,0); break;
    case 1: rotateY(PI); translate(-10,5,1); text("F",0,0); break;
    case 2: rotateY(PI); translate(-10,5,1); text("R",0,0); break;
    case 3: rotateY(PI); translate(-10,5,1); text("B",0,0); break;
    case 4: rotateY(PI); translate(-10,5,1); text("L",0,0); break;
    case 5: translate(-10,15,-1); rotateX(PI); text("D",0,25); break;
  }
}

void resetCube(){
  for(int side = 0; side < sides.length; side++){
    for(int row = 0; row < sides[side].length; row++){
      for(int col = 0; col < sides[side][row].length; col++){
        sides[side][row][col] = colors[side];
      }
    }
  }
}

void shuffleCube(){
  shuffleStepsLeft = random(20,50);
  shuffleTimer = shuffleStepsLeft * 5;
}


//---------------------------------------------------------------------------------------------------

void rr(){
  String s = sides[2][0][0];
  sides[2][0][0] = sides[2][2][0];
  sides[2][2][0] = sides[2][2][2];
  sides[2][2][2] = sides[2][0][2];
  sides[2][0][2] = s;
  s = sides[2][0][1];
  sides[2][0][1] = sides[2][1][0];
  sides[2][1][0] = sides[2][2][1];
  sides[2][2][1] = sides[2][1][2];
  sides[2][1][2] = s;
  s = sides[0][0][2];
  sides[0][0][2] = sides[3][0][2];
  sides[3][0][2] = sides[5][0][2];
  sides[5][0][2] = sides[1][2][0];
  sides[1][2][0] = s;
  s = sides[0][1][2];
  sides[0][1][2] = sides[3][1][2];
  sides[3][1][2] = sides[5][1][2];
  sides[5][1][2] = sides[1][1][0];
  sides[1][1][0] = s;
  s = sides[0][2][2];
  sides[0][2][2] = sides[3][2][2];
  sides[3][2][2] = sides[5][2][2];
  sides[5][2][2] = sides[1][0][0];
  sides[1][0][0] = s;  
}
//--------------------------------------------
void ru(){
  String s = sides[0][2][1];
  sides[0][2][1] = sides[0][1][2];
  sides[0][1][2] = sides[0][0][1];
  sides[0][0][1] = sides[0][1][0];
  sides[0][1][0] = s;
  s = sides[0][2][2];
  sides[0][2][2] = sides[0][0][2];
  sides[0][0][2] = sides[0][0][0];
  sides[0][0][0] = sides[0][2][0];
  sides[0][2][0] = s;
  s = sides[1][0][1];
  sides[1][0][1] = sides[4][0][1];
  sides[4][0][1] = sides[3][0][1];
  sides[3][0][1] = sides[2][0][1];
  sides[2][0][1] = s;
  s = sides[1][0][2];
  sides[1][0][2] = sides[4][0][2];
  sides[4][0][2] = sides[3][0][2];
  sides[3][0][2] = sides[2][0][2];
  sides[2][0][2] = s;
  s = sides[1][0][0];
  sides[1][0][0] = sides[4][0][0];
  sides[4][0][0] = sides[3][0][0];
  sides[3][0][0] = sides[2][0][0];
  sides[2][0][0] = s;
}
//--------------------------------------------
void rf(){
  String s = sides[1][0][1];
  sides[1][0][1] = sides[1][1][0];
  sides[1][1][0] = sides[1][2][1];
  sides[1][2][1] = sides[1][1][2];
  sides[1][1][2] = s;
  s = sides[1][0][0];
  sides[1][0][0] = sides[1][2][0];
  sides[1][2][0] = sides[1][2][2];
  sides[1][2][2] = sides[1][0][2];
  sides[1][0][2] = s;
  s = sides[0][0][1];
  sides[0][0][1] = sides[2][1][2];
  sides[2][1][2] = sides[5][2][1];
  sides[5][2][1] = sides[4][1][0];
  sides[4][1][0] = s;
  s = sides[0][0][2];
  sides[0][0][2] = sides[2][2][2];
  sides[2][2][2] = sides[5][2][0];
  sides[5][2][0] = sides[4][0][0];
  sides[4][0][0] = s;
  s = sides[0][0][0];
  sides[0][0][0] = sides[2][0][2];
  sides[2][0][2] = sides[5][2][2];
  sides[5][2][2] = sides[4][2][0];
  sides[4][2][0] = s;
}
//--------------------------------------------
void rl(){
  String s = sides[4][0][1];
  sides[4][0][1] = sides[4][1][0];
  sides[4][1][0] = sides[4][2][1];
  sides[4][2][1] = sides[4][1][2];
  sides[4][1][2] = s;
  s = sides[4][0][0];
  sides[4][0][0] = sides[4][2][0];
  sides[4][2][0] = sides[4][2][2];
  sides[4][2][2] = sides[4][0][2];
  sides[4][0][2] = s;
  s = sides[0][1][0];
  sides[0][1][0] = sides[1][1][2];
  sides[1][1][2] = sides[5][1][0];
  sides[5][1][0] = sides[3][1][0];
  sides[3][1][0] = s;
  s = sides[0][0][0];
  sides[0][0][0] = sides[1][2][2];
  sides[1][2][2] = sides[5][0][0];
  sides[5][0][0] = sides[3][0][0];
  sides[3][0][0] = s;
  s = sides[0][2][0];
  sides[0][2][0] = sides[1][0][2];
  sides[1][0][2] = sides[5][2][0];
  sides[5][2][0] = sides[3][2][0];
  sides[3][2][0] = s;
}
//--------------------------------------------
void rd(){
  String s = sides[5][2][1];
  sides[5][2][1] = sides[5][1][2];
  sides[5][1][2] = sides[5][0][1];
  sides[5][0][1] = sides[5][1][0];
  sides[5][1][0] = s;
  s = sides[5][2][2];
  sides[5][2][2] = sides[5][0][2];
  sides[5][0][2] = sides[5][0][0];
  sides[5][0][0] = sides[5][2][0];
  sides[5][2][0] = s;
  s = sides[1][2][0];
  sides[1][2][0] = sides[2][2][0];
  sides[2][2][0] = sides[3][2][0];
  sides[3][2][0] = sides[4][2][0];
  sides[4][2][0] = s;
  s = sides[1][2][1];
  sides[1][2][1] = sides[2][2][1];
  sides[2][2][1] = sides[3][2][1];
  sides[3][2][1] = sides[4][2][1];
  sides[4][2][1] = s;
  s = sides[1][2][2];
  sides[1][2][2] = sides[2][2][2];
  sides[2][2][2] = sides[3][2][2];
  sides[3][2][2] = sides[4][2][2];
  sides[4][2][2] = s;
}
//--------------------------------------------
void rb(){
  String s = sides[3][0][1];
  sides[3][0][1] = sides[3][1][2];
  sides[3][1][2] = sides[3][2][1];
  sides[3][2][1] = sides[3][1][0];
  sides[3][1][0] = s;
  s = sides[3][0][0];
  sides[3][0][0] = sides[3][0][2];
  sides[3][0][2] = sides[3][2][2];
  sides[3][2][2] = sides[3][2][0];
  sides[3][2][0] = s;
  s = sides[0][2][1];
  sides[0][2][1] = sides[2][1][0];
  sides[2][1][0] = sides[5][0][1];
  sides[5][0][1] = sides[4][1][2];
  sides[4][1][2] = s;
  s = sides[0][2][0];
  sides[0][2][0] = sides[2][0][0];
  sides[2][0][0] = sides[5][0][2];
  sides[5][0][2] = sides[4][2][2];
  sides[4][2][2] = s;
  s = sides[0][2][2];
  sides[0][2][2] = sides[2][2][0];
  sides[2][2][0] = sides[5][0][0];
  sides[5][0][0] = sides[4][0][2];
  sides[4][0][2] = s;
}
