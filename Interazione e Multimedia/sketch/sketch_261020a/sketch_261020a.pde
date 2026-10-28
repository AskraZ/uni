float shX = 0.1;
float shY = 0.1;

void setup(){
  background(255);
  fill(0,255,0);
  stroke(255,0,0);
  strokeWeight(5);
  rectMode(CENTER);
  size(500,500);
  frameRate(10);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  shearX(shX);
  shearY(shY);
  rect(0,0,150,150);
  shX += 0.1;
  shY += 0.1;
}








/*
float scale = 0.5;
int dir = 1;
void setup(){
  background(255);
  fill(0,0,255);
  stroke(0);
  strokeWeight(5);
  rectMode(CENTER);
  size(500,500);
  frameRate(10);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  scale(scale);
  rect(0,0,width,height);
  scale += dir*0.1;
  
  if (scale >= 1 || scale <= 0){
    dir = -dir;
  }
}
*/

/*
void setup(){
size(500,500);
rectMode(CENTER);
}

void draw(){
  translate(width/2, height/2);
  rotate(radians(frameCount%360));
  translate(50,50);
  rotate(radians(frameCount*10%360));
  fill(frameCount*3%255, frameCount*5%255, frameCount*7%255);
  rect(0,0,100,100);
}
*/






/*
float rot = 10;

void setup(){
  size(600,600);
  frameRate(15);
}

void draw(){
  fill(255,50);
  rect(0,0,width, height);
  translate(width/2, height/2);
  rotate(radians(rot));
  fill(0);
  ellipse(160,0,20,20);
  ellipse(120,0,20,20);
  ellipse(80,0,20,20);
  ellipse(40,0,20,20);
  rot += 20;
}
*/






/*int a1 = 0;
int a2 = 0;

void setup(){
  size(500,500);
  rectMode(CENTER);
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(a1));
  fill(255);
  rect(0,0,50,50);
  popMatrix();
  pushMatrix();
  translate(width/2+80, height/2);
  rotate(radians(a2));
  fill(255,0,0);
  rect(0,0,50,50);
  popMatrix();
  a1++;
  a2 += 4;
}
*/



// Rotazione e Rivoluzione
/*
void setup(){
size(500,500);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  fill(255);
  noStroke();
  rotate(millis()*0.001*TWO_PI*0.5);
  translate(80,0);
  ellipse(0,0,100,100);
  strokeWeight(5);
  stroke(255,0,0);
  line(0,0,60,0);
}
*/


//Roto-traslazione
/*
int a = 0;

void setup(){
  size(500,500);
  rectMode(CENTER);
}

void draw(){
  background(0);
  translate(width / 2, height / 2);
  rotate(radians(a));
  rect(0,0,50,50);
  a += 1;
}
*/


// Gravità
/*
float y = 0;
float x;
float speed = 2;
float gravity = 0.1;

void setup(){
  size(800,800);
  x = width/2;
}

void draw(){
  background(255);
  fill(255,0,0);
  stroke(0,0,255);
  ellipse(x,y,50,50);
  speed = speed + gravity;
  y += speed;
  
  if (y > height - 25){
    speed = speed * - 0.80;
    y = height - 25;  
}
}

*/
