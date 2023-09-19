// This is an implementation of a prob L-System
import java.util.HashMap;

public class ProbabilisticLSystem {
  
  // Member Variables for an Instance of this object 
  private String axiom;
  private HashMap<Character, String[]> rules;
  
  private int iterationNum = 0;
  
  // A temporary buffer for creating a new string
  private StringBuffer currentIterationBuffer = new StringBuffer();

  // The general distance to move
  private float moveDistance = 10;
  
  // The general angle to rotate
  private float rotateAngle = 90;
  
  // How much to scale the drawing of the l-system on each iteration
  private float scaleFactor = 1.0;

  // Constructor for making an Lsystem object with input parameters 
  public ProbabilisticLSystem(String axiom, 
                 HashMap<Character, String[]> rules, 
                 float moveDistance,
                 float rotateAngle,
                 float scaleFactor){
    // Initialize variables for Lsystem
    this.axiom = axiom;
    this.rules = rules;
    this.moveDistance = moveDistance;
    this.rotateAngle = rotateAngle;
    this.scaleFactor = scaleFactor;
    
    // Initialize current iteration (n = 0) to be the axiom
    reset();
  }
  
  // clears the current iteration string
  // to be used only within this class
  private void clearCurrentStringBuffer() {
    // Erases the string buffer holding the current iteration
    if (currentIterationBuffer.length() > 0) {
      currentIterationBuffer.delete(0, currentIterationBuffer.length());
    }
  };
     
  public void reset() {
   iterationNum = 0;
   this.clearCurrentStringBuffer();
   currentIterationBuffer.append(axiom); 
  }
  
  // Returns the current iteration string
  public String getIterationString() {
    return currentIterationBuffer.toString();
  }
  
  public int getIterationNum() {
     return iterationNum; 
  }
  
  public void printState() {
    println("n = ", iterationNum, " : ", currentIterationBuffer);
  }
  
  public void printIterationNumber() {
    println("n = ", iterationNum);
  }
  
  
  // runs 1 iteration, performing the rules for each character
  // on the current string. The result of the replacement is added to the 
  public void iterate() {
    // get a copy of the current iteration string
    String current = this.getIterationString();
    
    // Now clear the current iteration string: currentIterationBuffer
    this.clearCurrentStringBuffer();
    
    // Replace characters in the current string based on rules, 
    // and append them them to the currentIterationBuffer
    for (int i = 0; i < current.length(); i++) {
      Character c = current.charAt(i);
      if (rules.containsKey(c)) {
        if (c == 'a') { // delay mechanism 
          if (iterationNum < 1) {
            currentIterationBuffer.append(rules.get(c)[0]);
          } else {
            currentIterationBuffer.append(rules.get(c)[1]);
          }
        } else if (c == 'G') { // stochastic mechanism
           if (random(1) < 0.7) {
             currentIterationBuffer.append(rules.get(c)[0]);
           } else {
             currentIterationBuffer.append(rules.get(c)[1]);
           }
        }
          else {
          currentIterationBuffer.append(rules.get(c)[0]);
        }
      } else {
        currentIterationBuffer.append(c);
      }
    }
 
     // Increment our iteration after we are done
     iterationNum += 1;
  }
  
  // This function uses the turtle to draw based on each character in the LSystem's 
  // iteration string. It also handles scaling the moveDistance (to keep the image in frame), if desired
  public void drawLSystem(Turtle t) {
    // Get the current iteration numbers
    int iterationNum = this.getIterationNum();
        
    // Scale the move distance (if needed)
    float dist = this.moveDistance;
    
    // Helps keep the image in frame when it gets too big
    if (scaleFactor != 1) {
      dist = dist / (scaleFactor * (iterationNum + 1));
    }

    // Get the current iteration string
    String currentIteration = this.getIterationString(); 
    
    // record the previous direction for operations that needs to switch direction 
    // e.g. growth direction of a leave or flower 
    // where 0 is left and 1 is right
    int direction = 0;
    
    // Loop through each character in the iteration string,
    // and do turtle operations
    for (int i = 0; i < currentIteration.length(); i++) {
      Character c = currentIteration.charAt(i); 
      switch (c) {
        case 'F':
        case 'G':
          t.forward(dist);
          break; // The "break" breaks out of the switch statement and prevents the next cases from running
         case '+':
           t.left(this.rotateAngle);
           break;
         case '-':
           t.right(this.rotateAngle);
           break;
         case 'f':
           t.forward(random(dist));
           break;           
         case 'l':
           t.left(random(this.rotateAngle));
           break;
         case 'r':
           t.right(random(this.rotateAngle));
           break;
         case '[': // save the current state of the turtle
           t.push();
           break;
         case ']': // jump back to previously saved state of the turtle 
           t.pop();
           break;
         case 'a':
           break;
         case 'A':
           t.forward(dist);
           circle(t.getX(), t.getY(), dist/6);
           break;
         case 'I':
           t.forward(dist);
           break;
         case 'L': // drawing a leaf
           for (int j = 0; j < 4; j++) {
             // this part ensures that a leaf will grow in alternating direction 
             if ((direction % 2) == 0) {
               t.left(this.rotateAngle);
             } else {
               t.right(this.rotateAngle);
             }
             t.forward(dist/4);
           }
           direction = (direction + 1) % 2;            
           break;
         case 'K': // drawing a flower
         // this part ensures that a flower will grow in alternating direction 
           if ((direction % 2) == 0) {
             t.left(this.rotateAngle);
           } else {
             t.right(this.rotateAngle);
           }
           direction = (direction + 1) % 2;
           
           t.forward(dist);
           fill(0);
           circle(t.getX(), t.getY(), dist/3);
           break;
         default:
           // Throw an error if we don't have a draw operation implemented 
           throw new IllegalArgumentException("Missing a drawing operation case for character: " + c.toString());  
       }
    }
  }
}
