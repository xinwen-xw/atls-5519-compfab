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
  HashMap<Character, String[]> rules = new HashMap<>();
  String[] F_rules = {"F+F-F-FF+F+F-F"};
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
  HashMap<Character, String[]> rules = new HashMap<>();  
  String[] F_rules = {"F+G"};
  String[] G_rules = {"default", "F-G"};
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
  HashMap<Character, String[]> rules = new HashMap<>();  
  String[] F_rules = {"F-F++F-F"};
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
  HashMap<Character, String[]> rules = new HashMap<>();  
  String[] F_rules =  {"FF"};
  String[] G_rules = {"F[+G]F[-G]+G"};  
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
  HashMap<Character, String[]> rules = new HashMap<>();  
  String[] vegetative_apex_rules = {"I[L]a", "I[L]A"};
  rules.put('a', vegetative_apex_rules);
  String[] flowering_apex_rules = {"I[K]A"};
  rules.put('A', flowering_apex_rules);
  
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem initPanicle() {
  // initialize turtle variables
  float moveDist = 40;
  float rotateAngle = 30;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "a";
  
  // Create any production rules
  HashMap<Character, String[]> rules = new HashMap<>();  
  String[] vegetative_apex_rules = {"I[M]a", "I[M]J"};
  rules.put('a', vegetative_apex_rules);
  String[] flowering_apex_rules = {"I[M]I[+J]J"};
  rules.put('J', flowering_apex_rules);

  
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

LSystem initSingleFlowerShoot() {
  // initialize turtle variables
  float moveDist = 40;
  float rotateAngle = 30;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "a";
  
  // Create any production rules
  HashMap<Character, String[]> rules = new HashMap<>();  
  String[] vegetative_apex_rules = {"I[S]a", "I[S]A"};
  rules.put('a', vegetative_apex_rules);
  String[] flowering_apex_rules = {"T"};
  rules.put('A', flowering_apex_rules);
  
  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}


LSystem initUmbel(){
  // initialize turtle variables
  float moveDist = 100;
  float rotateAngle = 40;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "IB";
  
  // Create any production rules
  HashMap<Character, String[]> rules = new HashMap<>();
  String[] B_rules = {"I[++B][+B][B][-B][--B]"};
  rules.put('B', B_rules);


  // Create the Lsystem
  return new LSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}
