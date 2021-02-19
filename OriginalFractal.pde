int num = 3;
int holder = 20;
float deg = 0;
float place = 0;
public void setup(){
  size(800, 600);
  frameRate(30);
  shapeMode(CENTER);
}

public void draw(){
  background(0);
  translate(400, 300);
  rotate(deg);
  fractal(0, 0, holder, num);
  deg += place;
}

public void mousePressed(){
  if (num > 15) {
    num = 3;
  }
   else{
    stroke((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    fill((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255), 100);
    num += 1;
  }
}

public void keyPressed(){
  if (keyCode == UP){
    holder += 20;
  }
  else if (keyCode == DOWN){
    holder -= 20;
  }
  else if (key == 'r'){
    place += 0.01;
  }
  else if (key == 'd'){
    place -= 0.01;
  }
  else{
    place = 0;
  }
  
}

public void fractal(float x, float y, int len, int sides){
  polygon(x, y, len, sides);
  if (len > 20){
    fractal(x - len/1.5, y, len/3, sides);
    fractal(x + len/1.5, y, len/3, sides);
    fractal(x - len/3, y - len/1.75, len/3, sides);
    fractal(x + len/3, y - len/1.75, len/3, sides);
    fractal(x - len/3, y + len/1.75, len/3, sides);
    fractal(x + len/3, y + len/1.75, len/3, sides);
  }
  
}


public void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
