void setup(){

size(500,500);
background(0,255,0);
noStroke();
int l = 50;

for (int y = 0; y < height; y+=l){
  for(int x = 0; x < width; x+=l){
    fill(random(255),130);
    rect(x+random(-5,5),y-random(-5,5),l,l);
  }
}
}

void mousePressed(){
setup();
}

/*
int pos=0;
int dir=1;
int vel = 7;

void setup() {
  size(700, 700);
}





void draw() {
  background(255);
  line(pos%width, 20, pos%width, height-20);
  line(20, pos%width, height-20, pos%width);
    
  if (pos > width || pos < 0)
    dir =-dir;
    pos += dir * vel;
  
}
*/

/*
void draw(){
 textSize(40);
 text("A1", 185,50);
 text("C1", 10,50);
 text("C2", 15,300);
 text("A2", 190,300);
 stroke(255,0,0);
 line(185,50,mouseX,mouseY);
 line(15,300,190,300);
 stroke(0);
 bezier(185,50,mouseX,mouseY,190,300,15,300);
 
 }
 */
