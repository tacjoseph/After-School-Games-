float n = 0;
float c = 4;

void setup() {
  size(400, 400);
  background(0);
}

void draw() {
  
  float a = n * 137.5;
  float r = c * sqrt(n);
  float x = r * cos(a) + width / 2;
  float y = r * sin(a) + height / 2;
  fill(a % 256, 255, 255);
  noStroke();
  ellipse(x, y, 4, 4);
  n++;
}