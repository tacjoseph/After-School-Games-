float n = 0;
float c = 20;

void setup() {
  size(1000, 1000);
  background(0);
}

void draw() {
  
  float a = n * 137.5;
  float r = c * sqrt(n);
  float x = r * cos(a) + width / 2;
  float y = r * sin(a) + height / 2;
  fill(n % 250, mouseX, mouseY);
  noStroke();
  ellipse(x, y, n % 15, n % 15);
  n++;  
  
  if(n > 500){
   background(0); 
   n = 0;
  }
}
