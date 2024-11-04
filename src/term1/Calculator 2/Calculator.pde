// Sean Gandre | Calculator | Mon Sep 30 //<>//

Button[] buttons = new Button[30];
String dVal = "0";
float l, r, result;
String op;
boolean left;

void setup() {
  size(210, 220);

  // Create number buttons
  buttons[1] = new Button(30, 70, 20, 20, color(170), "Del", false);
  buttons[2] = new Button(60, 70, 20, 20, color(170), "Sp", true);
  buttons[3] = new Button(90, 70, 20, 20, color(170), "Sp", true);
  buttons[4] = new Button(115, 70, 20, 20, color(170), "Sp", true);
  buttons[5] = new Button(140, 70, 20, 20, color(170), "Sp", true);
  buttons[6] = new Button(170, 70, 20, 20, color(170), "Sp", true);
  buttons[7] = new Button(30, 100, 20, 20, color(125), "7", true);
  buttons[8] = new Button(60, 100, 20, 20, color(125), "8", false);
  buttons[9] = new Button(90, 100, 20, 20, color(170), "±", false);
  buttons[13] = new Button(30, 130, 20, 20, color(125), "1", true);
  buttons[14] = new Button(60, 130, 20, 20, color(125), "2", true);
  buttons[15] = new Button(85, 130, 20, 20, color(125), "3", true);
  buttons[16] = new Button(110, 130, 20, 20, color(170), "−", false);
  buttons[17] = new Button(140, 130, 20, 20, color(125), "Sp", true);
  buttons[18] = new Button(170, 115, 20, 50, color(125), "Sp", true);
  buttons[19] = new Button(30, 160, 20, 20, color(125), "4", true);
  buttons[20] = new Button(60, 160, 20, 20, color(125), "5", true);
  buttons[21] = new Button(85, 160, 20, 20, color(125), "6", true);
  buttons[22] = new Button(110, 160, 20, 20, color(125), "Sp", true);
  buttons[23] = new Button(140, 160, 20, 20, color(125), "Sp", true);
  buttons[24] = new Button(170, 175, 20, 50, color(125), "Sp", true);
  buttons[25] = new Button(30, 190, 20, 20, color(125), "7", true);
  buttons[26] = new Button(60, 190, 20, 20, color(125), "8", true);
  buttons[27] = new Button(85, 190, 20, 20, color(125), "9", true);
  buttons[28] = new Button(125, 190, 50, 20, color(125), "28", true);
  buttons[10] = new Button(30, 100, 20, 20, color(170), "C", false);
  buttons[11] = new Button(60, 100, 20, 20, color(170), "+", false);
  buttons[12] = new Button(130, 100, 40, 20, color(170), "=", false);
}

void draw() {
  background(50);
  updateDisplay();
  println("Left: " + l + " Right: " + r + " Result: " + result + " Op: " + op);
  for (Button button : buttons) {
    if (button != null) {
      button.display();
      button.hover(mouseX, mouseY);
    }
  }
}

void updateDisplay() {
  rectMode(CENTER);
  rect(width / 2, 25, 170, 20);
  fill(255);
  textSize(dVal.length() < 16 ? 16 : (dVal.length() == 16 ? 15 : 14));
  textAlign(RIGHT);
  text(dVal, width - 25, 30);
}

void mouseReleased() {
  for (int i = 0; i < buttons.length; i++) {
    if (buttons[i] != null && buttons[i].on) {
      if (buttons[i].isNum) {
        if (left && dVal.length() < 20) {
          dVal += buttons[i].val;
          l = float(dVal);
        } else if (!left && dVal.length() < 20) {
          dVal += buttons[i].val;
          r = float(dVal);
        }
      } else if (buttons[i].val.equals("C")) {

        resetValues();
      } else if (buttons[i].val.equals("+") || buttons[i].val.equals("-")) {
        op = buttons[i].val;
        dVal = "0";
        left = false;
      } else if (buttons[i].val.equals("=")) {
        if (op.equals("+")) {
          result = l + r;
        } else if (op.equals("-")) {
          result = l - r;
        }
        dVal = str(result);
        left = true;
        r = 0;
      } else if (buttons[i].val.equals("±")) {

        if (left) {
          l *= -1;
          dVal = str(l);
        } else {
          r *= -1;
          dVal = str(r);
        }
      } else if (buttons[i].val.equals("Del")) {

        if (left && dVal.length() > 0) {
          dVal = dVal.substring(0, dVal.length() - 1);
          l = float(dVal.isEmpty() ? "0" : dVal);
        }
      }
    }
  }
}

void resetValues() {
  dVal = "0";
  l = 0;
  r = 0;
  result = 0;
  op = " ";
  left = true;
}


void keyPressed() {
  println("Key: " + key + " KeyCode: " + keyCode);
  if ((keyCode >= '0' && keyCode <= '9') || (keyCode >= 96 && keyCode <= 105)) {
    int numValue = keyCode >= 96 ? keyCode - 96 : keyCode - '0';
    handleEvent(str(numValue), true);
  } else if (key == '+' || keyCode == 17) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 16) {
    handleEvent("-",false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  //if (left && dVal.length() < 12) {
  //  dVal = (dVal.equals("0") ? keyVal : dVal + keyVal);
  //  l = float(dVal);
  //} else if (!left && dVal.length() < 12) {
  //  dVal = (dVal.equals("0") ? keyVal : dVal + keyVal);
  //  r = float(dVal);
  //}
  if (keyVal.equals("+") && !isNum) {
    left = false;
    dVal = "0";
    op = "+";
  } else if (keyVal.equals("-") && !isNum) {
    left = false;
    dVal = "0";
    op = "-";
  }
}
