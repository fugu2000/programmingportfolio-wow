class Button {
  // member variables

  int x, y, w, h;
  color c1, c2, c3;
  String val;
  boolean on, isNum;
  // constructor

  Button(int x, int y, String val, int w, int h, boolean isNum) {
    this.x = x;
    this.y = y;
    this.val = val;
    this.w = w;
    this.h = h;
    c1 = color(#000000);
    c2 = color(#003200);
    c3 = color(#27A226);
    on = false;
    this.isNum = isNum;
  }

  // methods

  void display() {
    stroke(c3);
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x + w/2, y + h/2, w, h, 1);
    fill(c3);
    textAlign(CENTER, CENTER);
    textSize(16);
    text(val, x + w/2, y + h/2);
  }
  boolean hover(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
