float bg = 0;
float cc1 = 0, cc2 = 100, cc3 = 100;

void setup(){
  fullScreen();
  background(bg);
  frameRate(60);
}

void draw(){
  colorMode(HSB, 360, 100, 100);
  noStroke();

  if (mousePressed && (mouseButton == LEFT)){
    
    if(cc1 < 360){
      for(int i = 0; i < 360; i++){
        cc1 = cc1 + 0.001;
      }
    }
    if(cc1 >= 360){
      cc1 = 0; 
    }
    
  fill(cc1, cc2, cc3);
  ellipse(mouseX, mouseY, 25, 25);
  }
  
  else if(mousePressed && (mouseButton == RIGHT)) {
    fill(bg);
    ellipse(mouseX, mouseY, 50, 50);
  }
  //text(cc1, 5, 10);
}
