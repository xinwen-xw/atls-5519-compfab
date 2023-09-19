// Example probabilistic L systems - contains initialization functions

import java.util.HashMap;

ProbabilisticLSystem initProbSnowflake() {
  // initialize turtle variables
  float moveDist = 30;
  float rotateAngle = 60;

  float scaleFactor = 1.2;
  
  // The intial axiom / input string
  String axiom = "F++F++F";
  
  // Create any production rules  
  HashMap<Character, String[]> rules = new HashMap<>();
  String[] F_rules = {"FrfllfrF"};
  rules.put('F', F_rules);
  
  // Create the Lsystem
  return new ProbabilisticLSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}

ProbabilisticLSystem initProbTree() {
  // initialize turtle variables
  float moveDist = 5;
  float rotateAngle = 22;
  float scaleFactor = 1;
  
  // The intial axiom / input string
  String axiom = "G";
  
  // Create any production rules  
  HashMap<Character, String[]> rules = new HashMap<>();
  String[] F_rules = {"FF"};
  String[] G_rules = {"F[+G]F[+G]+G", "F[-G]F[-G]-G"};  
  rules.put('G', G_rules);
  rules.put('F', F_rules);
  
  // Create the Lsystem
  return new ProbabilisticLSystem(axiom, rules, moveDist, rotateAngle, scaleFactor);
}
