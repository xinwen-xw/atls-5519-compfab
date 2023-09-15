// processing sketch for drawing random simple shapes with random colors with mouse clicks

void setup() {
  size(600, 600);  
}

void draw() {
}

// draw a point + line, a circle, a triangle, or a rectangle randomly 
// when there's a mouse click event
void mouseClicked() {
  int dice = (int) random(0, 4);
  randomColor();
  
  if (dice % 4 == 0) { 
   // draw a point
    strokeWeight(10);
    point(mouseX, mouseY);
    // then draw a line from the point
    randomColor();
    strokeWeight(1);
    line(mouseX, mouseY, mouseX + random(-50, 50), mouseY + random(-50, 50));
  } else if (dice % 4 == 1) { 
    // draw a circle 
    circle(mouseX, mouseY, random(50, 100));
  } else if (dice % 4 == 2) { 
    // draw a triangle 
    triangle(
      mouseX, mouseY, 
      mouseX + random(50), mouseY - random(100), 
      mouseX + random(50), mouseY + random(100));
  } else { 
    // draw a rectangle
    rect(mouseX, mouseY, random(100), random(50));
  }
}

// generate a random color and update stroke and fill with this color
void randomColor() {
  var rColor = color(random(255), random(255), random(255));
  stroke(rColor);
  fill(rColor);
}
