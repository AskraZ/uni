int dir = 1; int v = 4; int r = 60; int x = r; int a = 30; int dira = -1; int va = 3;
void setup(){size(800,800); ellipseMode(RADIUS);}
void draw(){
background(0);
fill(255,255,0);
if (dir == 1)
arc(x,height/2, r,r, radians(a), radians (360-a));
else
arc(x, height/2, r,r,radians(180+a),radians(360+180-a));

fill(0);
ellipse(x, height/2-20, 3,3);

if (x >= width - r || x < r){
  dir = -dir;
}

if (a>30 || a <0)
  dira = - dira;
  a += dira*va;
  x+=dir * v;


}
