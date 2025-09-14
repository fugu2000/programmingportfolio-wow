// Marcus Nishikawa | Etch-A-Sketch | 18 September 2024
int x, y;
PImage el;

void setup() {
  size(800, 658);
  background(128);
  x = width / 2;
  y = height / 2;
  el = loadImage("Etch.png");
}

void draw() {
  image(el, 0, 0);
  strokeWeight(3);
  point(x, y);

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y -= 3;
    } else if (key == 'a' || key == 'A') {
      x -= 3;
    } else if (key == 's' || key == 'S') {
      y += 3;
    } else if (key == 'd' || key == 'D') {
      x += 3;
    }
  }
}

void keyPressed() {
  if (key == CODED);
  {
    if (keyCode == UP) {
      y -= 3;
    } else if (keyCode == LEFT) {
      x -= 3;
    } else if (keyCode == DOWN) {
      y += 3;
    } else if (keyCode == RIGHT) {
      x += 3;
    }
  }
}

void mousePressed() {
  saveFrame("line-#####.png");
}
