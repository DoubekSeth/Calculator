class Button {
  //Member Variables
  int x, y, w, h, v;
  char o;
  boolean hov, num;

  //Constructor
  Button(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  Button asNumber(int v) {
    num = true;
    this.v = v;
    return this;
  }

  Button asOperator(char o) {
    num = false;
    this.o = o;
    return this;
  }

  //Display Method
  void display() {
    stroke(0);
    if (hov) {
      fill(155, 155, 155);
    } else {
      fill(200, 200, 200);
    }
    rect(x, y, w, h);
    fill(255);
    if (num) {
      text(v, x+35, y+h-25);
    } else {
      //Making the ops look gucci
      textAlign(CENTER);
      if (o == '+') {
        text("+", x+37, y+h-25);
      } else if (o == '/') {
        text("÷", x+37, y+h-25);
      } else if (o == '-') {
        text("-", x+37, y+h-25);
      } else if (o == '*') {
        text("x", x+37, y+h-25);
      } else if (o == 'c') {
       text("Clr", x+37, y+h-25);
      } else if (o == 'b') {
        text("Back", x+37, y+h-25);
      } else if (o == 's') {
        text("+\n-", x+37, y+h-32);
      } else if (o == 'f') {
        text("Func", x+37, y+h-25);
      } else if (o == '.') {
        text("•", x+37, y+h-20);
      } else if (o == '=') {
        text("=", x+37, y+h-20);
      }
    }
  }
  //Hover Method
  void hover() {
    hov = mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }
}