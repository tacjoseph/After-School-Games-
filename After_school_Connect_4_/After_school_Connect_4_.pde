int w = 7, h = 6, bs = 100, player = 1;
int[][] board = new int [h][w];
void setup() {
  size(700, 600); ellipseMode(CORNER);
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
         p(y,x)==p(y,x+1)&&
         p(y,x)==p(y,x+2)&&
         p(y,x)==p(y,x+3)) 
         return p(y,x);
  for(int y=0;y<h;y++)for(int x=0;x<w;x++) for(int d = -1; d <=1 ; d +=2)
    if( p(y,x) != 0 && 
        p(y,x) == p(y +1*d, x+1) && 
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
void mousePressed() {
  int x = mouseX / bs, y = nextSpace(x);
  if(y>=0){
    board[y][x] = player;
    player = player==1?2:1;
  }
}
void draw () {
  if (getWinner() ==0) {
  for (int j=0;j<h;j++) for(int i=0;i<w;i++) {
    fill(255);
    rect(i*bs,j*bs,bs,bs);
    if(board[j][i]>0) {
      fill(board[j][i] ==1?255:0, board[j][i] ==2?255:0,0);
      ellipse(i*bs,j*bs,bs,bs);
    }
  }
}else {
  background(0) ;fill(255);text("Winner: "+getWinner()+". space restarts",width/2,height/2);
  if(keyPressed&&key==' ') {
     player=1; for (int y=0;y<h;y++)for (int x=0;x<w;x++) board[y][x]=0;
    }
  } 
}
