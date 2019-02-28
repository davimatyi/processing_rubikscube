String[][][] sides = {                                  //[oldal][sor][oszlop]
  {                                                     //top
    {"ffffffff","ffffffff","ffffffff"},
    {"ffffffff","ffffffff","ffffffff"},
    {"ffffffff","ffffffff","ffffffff"}
  }, 
  {                                                     //front
    {"ff00ff00","ff00ff00","ff00ff00"},
    {"ff00ff00","ff00ff00","ff00ff00"},
    {"ff00ff00","ff00ff00","ff00ff00"}
  },
  {                                                     //right
    {"ffff0000","ffff0000","ffff0000"},
    {"ffff0000","ffff0000","ffff0000"},
    {"ffff0000","ffff0000","ffff0000"},
  },
  {                                                     //back
    {"ff0000ff","ff0000ff","ff0000ff"},
    {"ff0000ff","ff0000ff","ff0000ff"},
    {"ff0000ff","ff0000ff","ff0000ff"}
  },
  {                                                     //left
    {"ffffa500","ffffa500","ffffa500"},
    {"ffffa500","ffffa500","ffffa500"},
    {"ffffa500","ffffa500","ffffa500"}
  },
  {                                                     //bottom
    {"ffffff00","ffffff00","ffffff00"},
    {"ffffff00","ffffff00","ffffff00"},
    {"ffffff00","ffffff00","ffffff00"}
  }
};

float rotationX = 0, rotationY = 0;
float prx = 0, pry = 0;
float mx = 0, my = 0;

void setup(){
  size(1280, 720, P3D);
  stroke(0);
  fill(unhex(sides[0][0][0]));
  rectMode(CENTER);
  rotateX(PI/2);
  translate(width/2,height/2, 0);
  
}

void draw(){
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
}

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
void rt(){
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
void rl(){
  
}
void rx(){
  
}
void rf(){
  
}
void rb(){
  
}


void keyPressed(){
  if(key == CODED){
    if(keyCode == RIGHT){
      rr();
    }
    if(keyCode == UP){
      rt();
    }
  }
}

void mousePressed(){
  mx = mouseX;
  my = mouseY;
}
void mouseReleased(){
  prx = rotationX;
  pry = rotationY;
}

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
