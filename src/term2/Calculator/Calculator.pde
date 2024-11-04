// Marcus Nishikawa | Calc | Oct 2 2024


Button[] buttons = new Button[24];

char op;
float l, r, result;
String dVal = "0";
boolean left;
void setup() {
  size(395, 220);
  frameRate(60);
  l = 0;
  r = 0;
  result = 0;
  left = true;
  op = ' ';
  buttons[0] = new Button(200, 185, "0", 60, 30, true);
  buttons[1] = new Button(5, 185, "1", 60, 30, true);
  buttons[2] = new Button(70, 185, "2", 60, 30, true);
  buttons[3] = new Button(135, 185, "3", 60, 30, true);
  buttons[4] = new Button(5, 150, "4", 60, 30, true);
  buttons[5] = new Button(70, 150, "5", 60, 30, true);
  buttons[6] = new Button(135, 150, "6", 60, 30, true);
  buttons[7] = new Button(5, 115, "7", 60, 30, true);
  buttons[8] = new Button(70, 115, "8", 60, 30, true);
  buttons[9] = new Button(135, 115, "9", 60, 30, true);
  buttons[10] = new Button(200, 115, "x", 60, 30, false);
  buttons[11] = new Button(265, 115, "/", 60, 30, false);
  buttons[12] = new Button(265, 150, "+", 60, 30, false);
  buttons[13] = new Button(200, 150, "-", 60, 30, false);
  buttons[14] = new Button(200, 80, "^", 60, 30, false);
  buttons[15] = new Button(265, 185, ".", 60, 30, false);
  buttons[16] = new Button(5, 80, "DEL", 60, 30, false);
  buttons[17] = new Button(70, 80, "x²", 60, 30, false);
  buttons[18] = new Button(135, 80, "%", 60, 30, false);
  buttons[19] = new Button(330, 80, "CA", 60, 30, false);
  buttons[20] = new Button(265, 80, "√", 60, 30, false);
  buttons[21] = new Button(330, 115, "±", 28, 65, false);
  buttons[22] = new Button(362, 115, "=", 28, 65, false);
  buttons[23] = new Button(330, 185, "π", 60, 30, true);
  //for (int i = 0; i < 5; i += 1); {
  //  rect((int(int(i * 60) + 5)), 80, 65, 95);
  //}
}

void draw() {
  background(0);
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].hover(mouseX, mouseY);
    buttons[i].display();
    rectMode(CORNER);
    fill(0);
    stroke(#27A226);
    updateDisplay();
  }
}

void mousePressed() {

  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i].on) {

      if (buttons[i].isNum) {
        if (buttons[i].val.equals("π")) {
          if (left) {
            l = 3.1415926535897932;
            dVal = str(l);
          } else {
            r = 3.1415926535897932;
            dVal = str(r);
          }
        } else if (dVal.length() < 19) {

          if (dVal == "0" || dVal == "0" || dVal == "Nan") {

            if (left) {

              dVal = buttons[i].val;
              l = float(dVal);
            } else {

              dVal = buttons[i].val;
              r = float(dVal);
            }
          } else if (left) {

            dVal += buttons[i].val;
            l = float(dVal);
          } else {

            dVal += buttons[i].val;
            r = float(dVal);
          }
        }
      } else if (buttons[i].val.equals("+")) {

        op = '+';
        left = false;
        dVal = "0";
      } else if (buttons[i].val.equals("-")) {

        op = '-';
        left = false;
        dVal = "0";
      } else if (buttons[i].val.equals("x")) {

        op = '*';
        left = false;
        dVal = "0";
      } else if (buttons[i].val.equals("/")) {

        op = '/';
        left = false;
        dVal = "0";
      } else if (buttons[i].val.equals("^")) {

        op = '^';
        left = false;
        dVal = "0";
      } else if (buttons[i].val.equals("x²")) {

        op = 'X';
        left = true;
        result = pow(l, 2);
        dVal = str(result);
        l = result;
      } else if (buttons[i].val.equals("%")) {
        if (left) {
          l *= 0.01;
          dVal = str(l);
        } else {
          r *= 0.01;
          dVal = str(r);
        }
      } else if (buttons[i].val.equals("√")) {
        if (left) {
          l = sqrt(l);
          dVal = str(l);
        } else {
          r = sqrt(r);
          dVal = str(r);
        }
      } else if (buttons[i].val.equals(".")) {
        if (!dVal.contains(".")) {
          dVal += buttons[i].val;
        }
      } else if (buttons[i].val.equals("DEL")) {
        if (dVal == "0") {
        } else if (left) {
          dVal= dVal.substring(0, max(0, dVal.length()-1));
          l = float(dVal);
        } else {
          dVal= dVal.substring(0, max(0, dVal.length()-1));
          l = float(dVal);
        }
        if (dVal == "") {
          dVal = "0";
          if (left) {
            l = float(dVal);
          } else {
            r = float(dVal);
          }
        }
      } else if (buttons[i].val.equals("CA")) {

        l = 0;
        left = true;
        op = ' ';
        r = 0;
        result = 0;
        dVal = "0";
      } else if (buttons[i].val.equals("=")) {

        performCalculation();
      } else if (buttons[i].val.equals("±")) {
        if (left) {
          l *= -1;
          dVal = str(l);
        } else {
          r *= -1;
          dVal = str(r);
        }
      }
      println("Left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + " L:" + left + " Display:" + dVal);
    }
  }
}

void updateDisplay() {
  rect(5, 5, 385, 70, 2);
  textAlign(RIGHT);
  fill(#27A226);
  if (dVal.length() < 13) {
    textSize(60);
  } else {
    textSize(60 - pow(dVal.length(), 1.02));
  }
  text(dVal, 385, 65);
}

void performCalculation() {
  if (op == '+') {

    result = l + r;
    dVal = str(result);
  } else if (op == '-') {

    result = l - r;
    dVal = str(result);
  } else if (op == '*') {

    result = l * r;
    dVal = str(result);
  } else if (op == '/') {

    result = l / r;
    dVal = str(result);
  } else if (op == '^') {

    result = pow(l, r);
    dVal = str(result);
  } else if (op == ' ') {

    result = l;
    dVal = str(result);
  }

  l = result;
}

void keyPressed() {
  println("Key: " + key);
  println("KeyCode: " + keyCode);
  if (key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (keyCode == 127 || keyCode == 8) {
    handleEvent("DEL", false);
  } else if ( key == '*' || keyCode == 106) {
    handleEvent("x", false);
  } else if ( key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if ( key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if ( key == '/' || keyCode == 47 || keyCode == 111) {
    handleEvent("/", false);
  } else if ( key == '=' || keyCode == 10 || keyCode == 61) {
    handleEvent("=", false);
  } else if (keyCode == 12) {
    handleEvent("CA", false);
  } else if (keyCode == 46 || key == '.' || keyCode == 110) {
    handleEvent(".", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (isNum) {
    if (keyVal ==("π")) {
      if (left) {
        l = 3.1415926535897932;
        dVal = str(l);
      } else {
        r = 3.1415926535897932;
        dVal = str(r);
      }
    } else if (dVal.length() < 19) {

      if (dVal == "0" || dVal == "0" || dVal == "NaN") {

        if (left) {

          dVal = keyVal;
          l = float(dVal);
        } else {

          dVal = keyVal;
          r = float(dVal);
        }
      } else if (left) {

        dVal += keyVal;
        l = float(dVal);
      } else {

        dVal += keyVal;
        r = float(dVal);
      }
    }
  } else if (keyVal == ("+")) {

    op = '+';
    left = false;
    dVal = "0";
    if (left) {
    left = false;
  } else {
    left = true;
  }

  } else if (keyVal == ("-")) {

    op = '-';
    left = false;
    dVal = "0";
    if (left) {
    left = false;
  } else {
    left = true;
  }

  } else if (keyVal ==("x")) {

    op = '*';
    left = false;
    dVal = "0";
  } else if (keyVal ==("/")) {

    op = '/';
    left = false;
    dVal = "0";
    if (left) {
    left = false;
  } else {
    left = true;
  }

  } else if (keyVal ==("^")) {

    op = '^';
    left = false;
    dVal = "0";
    if (left) {
    left = false;
  } else {
    left = true;
  }

  } else if (keyVal == ("x²")) {

    op = 'X';
    left = true;
    result = pow(l, 2);
    dVal = str(result);
    l = result;
  } else if (keyVal == ("%")) {
    if (left) {
      l *= 0.01;
      dVal = str(l);
    } else {
      r *= 0.01;
      dVal = str(r);
    }
  } else if (keyVal == ("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (keyVal ==(".")) {
    if (!dVal.contains(".")) {
      dVal += keyVal;
    }
  } else if (keyVal == ("DEL")) {
    if (dVal == "0") {
    } else if (left) {
      dVal= dVal.substring(0, max(0, dVal.length()-1));
      l = float(dVal);
    } else {
      dVal= dVal.substring(0, max(0, dVal.length()-1));
      l = float(dVal);
    }
    if (dVal == "") {
      dVal = "0";
      if (left) {
        l = float(dVal);
      } else {
        r = float(dVal);
      }
    }
  } else if (keyVal == ("CA")) {

    l = 0;
    left = true;
    op = ' ';
    r = 0;
    result = 0;
    dVal = "0";
  } else if (keyVal == ("=")) {

    performCalculation();
  } else if (keyVal == ("±")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  }
  println("Left:" + l + " Right:" + r + " Result:" + result + " Op:" + op + " L:" + left + " Display:" + dVal);
}
