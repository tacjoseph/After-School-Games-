int w = 7, h = 6, bs = 100, player = 1;

int posX = 0;
int posY = 0;

int[][] board = new int [h][w];
void setup() {
  size(700, 700); ellipseMode(CORNER);
}
int p(int y, int x) {
  return (y<0|| x<0|| y>=h|| x>=w)?0:board[y][x];
}
int getWinner() { //rows, columns, diagnoals
  for(int y=0;y<h;y++)for(int x=0;x<w;x++)
     if(  p(y,x) !=0 && 
          p(y,x)==p(y,x+1)&&
          p(y,x)==p(y,x+2)&&
          p(y,x)==p(y,x+3)) 
          return p(y,x);
  for(int y=0;y<h;y++)for(int x=0;x<w;x++)
     if( p(y,x) !=0 &&
         p(y,x)==p(y+1,x+1)&&
         p(y,x)==p(y+2,x+2)&&
         p(y,x)==p(y+3,x+3)) 
         return p(y,x);
  for(int y=0;y<h;y++)for(int x=0;x<w;x++) for(int d = -1; d <=1 ; d +=2)
    if( p(y,x) != 0 && 
        p(y,x) == p(y+1 *d, x+1) && 
        p(y,x) == p(y+2 *d, x+2) &&
        p(y,x) == p(y+3 *d, x+3))
        return p(y,x);
  for(int y=0;y<h;y++)for(int x=0;x<w;x++)
    if(p(y,x) == 0) return 0;
  return -1;
}
int nextSpace(int x) {
  for(int y=h-1;y>=0;y--) if(board[y] [x] ==0) return y;
  return -1;
}
void keyPressed() {
if(keyPressed&&key==' ') {
     int x = posX / bs, y = nextSpace(x);
  if(y>=0){
    board[y][x] = player;
    player = player==1?2:1;
  }
  }
  
}

int velocity = 10;
void draw () {
  // Check if the ball is on the left or right
  // multiply by -1
  // need an if statement
  background(0);
  ellipse(posX,posY, bs, bs);
  posX = posX + velocity;
 if(posX >= width - bs || posX < 0){
   velocity= velocity * -1;
   
 }
 
  
  if (getWinner() ==0) {
  for (int j=0;j<h;j++) for(int i=0;i<w;i++) {
    fill(255);
    rect(i*bs,j*bs + bs,bs,bs);
    if(board[j][i]>0) {
      fill(board[j][i] ==1?255:0, board[j][i] ==2?255:0,0);
      ellipse(i*bs, bs+j*bs , bs, bs);
    }
  }
}else {
  background(0) ;fill(255);text("Winner: "+getWinner()+". r restarts",width/2,height/2);
  if(keyPressed&&key=='r') {
     player=1; for (int y=0;y<h;y++)for (int x=0;x<w;x++) board[y][x]=0;
    }
  } 

}
