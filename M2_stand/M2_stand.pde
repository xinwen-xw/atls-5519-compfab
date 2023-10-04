import processing.svg.*;

float slitWidth = 6;
float slitHeight = 18;
float standWidth = 1145;
float standHeight = 130;

void setup() {
  // set-up drawing
  size(1200, 1200);
  background(255);
  stroke(0);
  noFill();
  
  noLoop();
}

void draw() {
  background(255);
  
  //// draw standoutline
  //rect(0, 0, standWidth, standHeight, 28); 
  
  //// draw slits
  //drawSlit(75, standHeight/2);
  //drawSlit(75+280, standHeight/2);
  //drawSlit(75+280+125, standHeight/2);
  //drawSlit(75+280+125+215, standHeight/2);
  //drawSlit(75+280+125+215+125, standHeight/2);
  //drawSlit(75+280+125+215+125+125, standHeight/2);
  //drawSlit(75+280+125+215+125+125+125, standHeight/2);

  //fill(0);
  //textSize(20);
  //text("L-system plants", 75, standHeight-10); 
  
  // kerf testing 
  drawKerfRect(10, 10, 200, 50, true);
  drawKerfRect(10, 70, 50, 200, false);
  drawKerfRect(250, 10, 100, 25, true);
  drawKerfRect(250, 70, 25, 100, false);
}

void drawSlit(float centerX, float centerY) {
  rect(centerX-slitWidth/2, centerY-slitHeight/2, slitWidth, slitHeight); 
}

void drawKerfRect(
  float startX, float startY,
  float w, float h, boolean vertical) {
  stroke(0);
  rect(startX, startY, w, h); 
  float c = 10;
  if (vertical) {
    float lineStart = startX + w/19;
    for (int i=0; i<18; i++) {
      line(lineStart, startY, lineStart, startY+h);
      lineStart += w/19;
    }  
  } else {
    float lineStart = startY + h/19;
    for (int i=0; i<18; i++) {
      line(startX, lineStart, startX+w, lineStart);
      lineStart += h/19;
    } 
  }
}

void keyPressed() {
  switch (key) { 
    case 's':
      // Export as SVG
      //press the 's' key to save a svg of your drawing
      if (key == 's') {
        // Name of the output file is "lsystem-" with a date string 
        String fileName = "output/stand-" + getDateString() + ".svg";
        beginRecord(SVG, fileName);
        draw();
        endRecord();
        println("Saved to file: " + fileName);
      }
   }
 }
 
// Makes a date string (used for filenames)
String getDateString() {
  String time = str(hour()) + "_" + str(minute()) + "_" + str(second());
  String date = str(year()) + "_" + str(month()) + "_" + str(day());
  return date + "-" + time;
}
