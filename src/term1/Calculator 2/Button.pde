class Button {
  // Member Variables
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, int w, int h, color c1, String val, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    this.c2 = color(80); // Default hover color
    this.val = val;
    on = false;
    this.isNum = isNum;
  }

  // Member Methods
  void display() {
    fill(on ? c2 : c1); // Ternary operator for fill color
    rect(x, y, w, h);
    
    fill(0);
    textAlign(RIGHT,LEFT);
    textSize(13); // Set text size
    text(val, x + w / 2, y + h / 2);
  }

  // Hover method
  boolean hover(int mx, int my) {
    on = (mx > x-w/2 && mx < x + w/2 && my > y - h/2 && my < y + h/2);
    return on;
  }
}
