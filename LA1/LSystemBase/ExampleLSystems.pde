// ExampleLSystem - contains initialization functions
// to set up parameters and init the LSystem (from the main file)

import java.util.HashMap;

// This function returns an initialized LSystem for a "Square based L-System"
LSystem initSquare() {
  // initialize turtle variables
  float moveDist = 10;
  float rotateAngle = 90;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "F+F+F+F";
  
  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F+F-F-FF+F+F-F");
    
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, rotateAngle, scaleFactor);
}

LSystem initDragon() {
  // initialize turtle variables
  float moveDist = 10;
  float rotateAngle = 90;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "F";
  
  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F+G");
  rules.put('G', "F-G");
  
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, rotateAngle, scaleFactor);
}

LSystem initSnowflake() {
  // initialize turtle variables
  float moveDist = 10;
  float rotateAngleLeft = 120;
  float rotateAngleRight = 60;
  float scaleFactor = 2;
  
  // The intial axiom / input string
  String axiom = "F+F+F";
  
  // Create any production rules
  HashMap<Character, String> rules = new HashMap<>();
  rules.put('F', "F-F+F-F");
  
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngleLeft, rotateAngleRight, scaleFactor);
}
