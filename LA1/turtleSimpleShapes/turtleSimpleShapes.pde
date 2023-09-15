// processing sketch creating simple shapes with the Turtle library
import Turtle.*;
Turtle t;

void setup() {
  size(500,500);
  stroke(0);
  t = new Turtle(this);
  noLoop();
}

void draw() {
  // position turtle on canvas and draw a capital I
  t.setX(100); 
  t.setY(100);
  t.back(100);

  // reposition turtle on canvas and draw a capital T
  t.setX(200);
  t.setY(100);
  // draw the first stroke
  t.right(90);
  t.forward(80);
  t.penUp();
  // draw the second stroke
  t.setX(200+40);
  t.setY(100);
  t.penDown();
  t.right(90);
  t.forward(100);

  // reposition turtle on canvas and draw a triangle 
  t.setX(400);
  t.setY(100);
  drawRegularPolygon(3, 100);
  
  // reposition turtle on canvas and draw a regular pentagon 
  t.setX(200);
  t.setY(300);
  drawRegularPolygon(5, 100);
  
  // reposition turtle on canvas and 
  // draw a circle by approximating it with a regular polygon with a large number of sides
  t.setX(400);
  t.setY(350);
  drawRegularPolygon(100, 5);
}

void drawRegularPolygon(int numberOfSides, float sideLength) {
  for (int i = 0; i < numberOfSides; i++){
    t.forward(sideLength);
    t.right(180-(numberOfSides-2)*180/numberOfSides);
  }
}
