Button[] numButton = new Button[10];
Button[] opButton = new Button[10];
String ls, rs;
float ans, tempLs, tempRs;
char op;
boolean left, eq, screen;


void setup() {
  size(281, 411);
  ls = "";
  rs = "";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
  //tempLs = 0;
  //tempRs = 0;
}

void draw() {
  background(200);
  if (screen == false) {
    screen();
  } else {
    background(200);
    screen2();
  }
  for (int i = 0; i < numButton.length; i++) {
    numButton[i].display();
    numButton[i].hover();
  }
  for (int i = 0; i < opButton.length; i++) {
    opButton[i].display();
    opButton[i].hover();
  }
  updateDisplay();
  debug();
}

void mouseReleased() {
  for (int i=0; i < numButton.length; i++) {
    if (numButton[i].hov && left) {
      ls += numButton[i].v;
    } else if (numButton[i].hov && !left) {
      rs+= numButton[i].v;
    }
  }
  for (int i=0; i < opButton.length; i++) {
    if (opButton[i].hov && opButton[i].o == 'c') {
      performClear();
    } else if (opButton[i].hov && opButton[i].o == '+') {
      left = false;
      op = '+';
      eq = false;
    } else if (opButton[i].hov && opButton[i].o == '=') {
      performCalc();
      eq = true;
    } else if (opButton[i].hov && opButton[i].o == '-') {
      left = false;
      op = '-';
      eq = false;
    } else if (opButton[i].hov && opButton[i].o == '/') {
      left = false;
      op = '/';
      eq = false;
    } else if (opButton[i].hov && opButton[i].o == '*') {
      left = false;
      op = '*';
      eq = false;
    } else if (opButton[i].hov && opButton[i].o == 's') {
      if (left == true) {
        tempLs = float(ls) * -1;
        ls = str(tempLs);
      } else {
        tempRs = float(rs) * -1;
        rs = str(tempRs);
      }
    } else if (opButton[i].hov && opButton[i].o == '.') {
      if (left == true) {
        ls += ".";
      } else {
        rs += ".";
      }
    } else if (opButton[i].hov && opButton[i].o == 'b') {
      if (eq == false) {
        if (left == true) {
          ls = ls.substring(0, ls.length() -1);
        } else {
          rs = rs.substring(rs.length()-1, rs.length());
        }
      }
    } else if (opButton[i].hov && opButton[i].o == 'f') {
      screen = true;
    }
  }
}

void updateDisplay() {
  fill(255);
  textAlign(LEFT);
  if (eq) {
    text((float)ans, 2, 80);
  } else {
    if (left) {
      text(ls, 2, 80);
    } else {
      text(rs, 2, 80);
    }
  }
}

void performCalc() {
  if (op == '+') {
    ans = float(ls) + float(rs);
    ls = str(ans);
    rs = "";
    op = ' ';
    left = false;
  } else if (op == '-') {
    ans = float(ls) - float(rs);
    ls = str(ans);
    rs = "";
    op = ' ';
    left = false;
  } else if (op == '/') {
    ans = float(ls) / float(rs);
    ls = str(ans);
    rs = "";
    op = ' ';
    left = false;
  } else if (op == '*') {
    ans = float(ls) * float(rs);
    ls = str(ans);
    rs = "";
    op = ' ';
    left = false;
  }
}

void performClear() {
  ls = "";
  rs = "";
  ans = 0.0;
  eq = false;
  left = true;
}

void screen() {
  //START THE BUTTONS
  numButton[0] = new Button(0, 360, 70, 50).asNumber(0);
  numButton[1] = new Button(0, 300, 70, 60).asNumber(1);
  numButton[2] = new Button(70, 300, 70, 60).asNumber(2);
  numButton[3] = new Button(140, 300, 70, 60).asNumber(3);
  numButton[4] = new Button(0, 240, 70, 60).asNumber(4);
  numButton[5] = new Button(70, 240, 70, 60).asNumber(5);
  numButton[6] = new Button(140, 240, 70, 60).asNumber(6);
  numButton[7] = new Button(0, 180, 70, 60).asNumber(7);
  numButton[8] = new Button(70, 180, 70, 60).asNumber(8);
  numButton[9] = new Button(140, 180, 70, 60).asNumber(9);
  //START THE OPERATORS
  opButton[0] = new Button(210, 300, 70, 60).asOperator('+');
  opButton[1] = new Button(210, 240, 70, 60).asOperator('-');
  opButton[2] = new Button(210, 180, 70, 60).asOperator('/');
  opButton[3] = new Button(210, 120, 70, 60).asOperator('*');
  opButton[4] = new Button(70, 120, 70, 60).asOperator('c');
  opButton[5] = new Button(0, 120, 70, 60).asOperator('b');
  opButton[6] = new Button(140, 360, 70, 50).asOperator('s');
  opButton[7] = new Button(140, 120, 70, 60).asOperator('f');
  opButton[8] = new Button(70, 360, 70, 50).asOperator('.');
  opButton[9] = new Button(210, 360, 70, 50).asOperator('=');
}
void screen2() {
}

void debug() {
  text("Left: " + left, 2, 10);
  text("Ls: " + ls, 2, 20);
  text("Rs: " + rs, 2, 30);
  text("Op: " + op, 2, 40);
  text("Ans: " + ans, 2, 50);
  text("Screen: " + screen, 2, 60);
}