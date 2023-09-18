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
  HashMap<Character, HashMap<String, String>> rules = new HashMap<>();
  HashMap<String, String> F_rules = new HashMap<>();
  F_rules.put("default", "F+F-F-FF+F+F-F");
  rules.put('F', F_rules);
    
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem initDragon() {
  // initialize turtle variables
  float moveDist = 10;
  float rotateAngle = 90;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "F";
  
  // Create any production rules
  HashMap<Character, HashMap<String, String>> rules = new HashMap<>();
  HashMap<String, String> F_rules = new HashMap<>();
  F_rules.put("default", "F+G");
  HashMap<String, String> G_rules = new HashMap<>();
  G_rules.put("default", "F-G");
  rules.put('F', F_rules);
  rules.put('G', G_rules);
  
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem initSnowflake() {
  // initialize turtle variables
  float moveDist = 10;
  float rotateAngle = 60;

  float scaleFactor = 2;
  
  // The intial axiom / input string
  String axiom = "F++F++F";
  
  // Create any production rules  
  HashMap<Character, HashMap<String, String>> rules = new HashMap<>();
  HashMap<String, String> F_rules = new HashMap<>();
  F_rules.put("default", "F-F++F-F");
  rules.put('F', F_rules);
  
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem initTree() {
  // initialize turtle variables
  float moveDist = 5;
  float rotateAngle = 22;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "G";
  
  // Create any production rules  
  HashMap<Character, HashMap<String, String>> rules = new HashMap<>();
  HashMap<String, String> F_rules = new HashMap<>();
  F_rules.put("default", "FF");
  HashMap<String, String> G_rules = new HashMap<>();
  G_rules.put("default", "F[+G]F[-G]+G");  
  rules.put('G', G_rules);
  rules.put('F', F_rules);
  
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem initInflorescences() {
  // initialize turtle variables
  float moveDist = 40;
  float rotateAngle = 30;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "a";
  
  // Create any production rules
  HashMap<Character, HashMap<String, String>> rules = new HashMap<>();
  HashMap<String, String> vegetative_apex_rules = new HashMap<>();
  vegetative_apex_rules.put("init", "I[L]a");
  vegetative_apex_rules.put("growth", "I[L]A");
  rules.put('a', vegetative_apex_rules);
  HashMap<String, String> flowering_apex_rules = new HashMap<>();
  flowering_apex_rules.put("default", "I[K]A");
  rules.put('A', flowering_apex_rules);
  
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}
