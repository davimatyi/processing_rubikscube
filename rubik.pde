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
    {"ffff0000","ffff00ff","ffff0000"},
    {"ffff0000","ffff0000","ffff0000"},
    {"ffff0000","ffff0000","ffffbb00"},
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

float rotation = 0;

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
  rotateY(mouseX/float(width) * PI*2);
  rotateX(mouseY/float(width) * PI*2);
  rotation+=0.02;
  pushMatrix();
  
  translate(-100, -150, 100);
  for(int i = 0; i<3; i++){
    for(int j = 0; j<3; j++){
      rotateX(PI/2);
      fill(unhex(sides[0][i][j]));
      rect(0,0,100,100);
      rotateX(- PI/2);
      translate(100,0,0);
    }
    translate(-300,0,-100);
  }
  popMatrix();
  pushMatrix();
  translate(-100, 150, 100);
  for(int i = 0; i<3; i++){
    for(int j = 0; j<3; j++){
      rotateX(PI/2);
      fill(unhex(sides[5][i][j]));
      rect(0,0,100,100);
      rotateX(- PI/2);
      translate(100,0,0);
    }
    translate(-300,0,-100);
  }
  popMatrix();
  pushMatrix();
  translate(-150, -100, -100);
  for(int i = 0; i<3; i++){
    for(int j = 0; j<3; j++){
      rotateY(PI/2);
      fill(unhex(sides[4][i][j]));
      rect(0,0,100,100);
      rotateY(- PI/2);
      translate(0,0,100);
    }
    translate(0,100,-300);
  }
  popMatrix();
  pushMatrix();
  translate(150, -100, -100);
  for(int i = 0; i<3; i++){
    for(int j = 0; j<3; j++){
      rotateY(PI/2);
      fill(unhex(sides[2][i][j]));
      rect(0,0,100,100);
      rotateY(- PI/2);
      translate(0,0,100);
    }
    translate(0,100,-300);
  }
  popMatrix();
  pushMatrix();
  translate(-100, -100, -150);
  for(int i = 0; i<3; i++){
    for(int j = 0; j<3; j++){
      fill(unhex(sides[3][i][j]));
      rect(0,0,100,100);
      translate(100,0,0);
    }
    translate(-300,100,0);
  }
  popMatrix();
  pushMatrix();
  translate(-100, -100, 150);
  for(int i = 0; i<3; i++){
    for(int j = 0; j<3; j++){
      fill(unhex(sides[1][i][j]));
      rect(0,0,100,100);
      translate(100,0,0);
    }
    translate(-300,100,0);
  }
  popMatrix();
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
  
}
void rl(){
  
}
void rt(){
  
}
void rx(){
  
}
void rf(){
  
}
void rb(){
  
}


void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      rr();
    }
  }
}
