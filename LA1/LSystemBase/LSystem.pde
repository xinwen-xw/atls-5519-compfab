// This is an implementation of an L-System
// Assumes all input vocabulary not given a rule are constants. 
// Though you could give an explicit rule for a constant using "F" --> "F"
// It uses StringBuffer to handle replacing characters in production rules
// in order to avoid wasteful creation of strings and memory problems
// original @author: @mriveralee
import java.util.HashMap;
import java.lang.Math;


public class LSystem {
  
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
  public LSystem(String axiom, 
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
        if (c == 'a') {
          if (iterationNum < 2) {
            currentIterationBuffer.append(rules.get(c)[0]);
          } else {
            currentIterationBuffer.append(rules.get(c)[1]);
          }
        } else if (c == 'A' & rules.get(c).length > 1) {
          if (iterationNum < 6) {
            currentIterationBuffer.append(rules.get(c)[0]);
          } else {
            currentIterationBuffer.append(rules.get(c)[1]);
          }
        } else {
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
    
    // number of bracket 
    int b = 0;
    // Loop through each character in the iteration string,
    // and do turtle operations
    for (int i = 0; i < currentIteration.length(); i++) {
      Character c = currentIteration.charAt(i); 
      switch (c) {
        case 'F':
          t.forward(dist);
          break;
        case 'G':
          t.forward(dist);
          break; // The "break" breaks out of the switch statement and prevents the next cases from running
         case '+':
           t.left(this.rotateAngle);
           break;
         case '-':
           t.right(this.rotateAngle);
           break;
         case '[': // save the current state of the turtle
           t.push();
           b += 1;
           break;
         case ']': // jump back to previously saved state of the turtle 
           t.pop();
           b -= 1;
           break;
         case 'a':
           break;
         case 'A': // draw a simple circle flowering apex
           t.forward(dist*1.5);
           circle(t.getX(), t.getY(), dist/3);
           break;
         case 'I':
           t.forward(dist);
           break;
         case 'B':
           float ratio = (float)Math.pow(0.5, b);
           t.forward(dist*ratio);
           circle(t.getX(), t.getY(), dist/8);
           break;
         case 'L': // draw a leaf growing in alternating direction
           drawSlantedAlternatingLeaf(t, direction, this.rotateAngle, dist);
           // flip direction so the next leaf will grow in the other direction 
           direction = (direction + 1) % 2;            
           break;
         case 'S': // draw a set of leaf growing sideways 
           drawSideGrowingLeaf(t, dist);
           break;
         case 'K': // draw a simple circle flower that grows in alternating direction 
           if ((direction % 2) == 0) {
             t.left(this.rotateAngle);
           } else {
             t.right(this.rotateAngle);
           }
           direction = (direction + 1) % 2;
           
           t.forward(dist);
           circle(t.getX(), t.getY(), dist/2.5);
           break;
         case 'J':
           t.forward(dist);
           circle(t.getX(), t.getY(), dist/2.5);
           break;
         case 'M': 
           if ((direction % 2) == 0) {
             for (int j=0; j<5; j++) {
               t.forward(dist/5);
               t.left(this.rotateAngle/2);
             }
           } else {
             for (int j=0; j<5; j++) {
               t.forward(dist/5);
               t.right(this.rotateAngle/2);
             }
           }
           direction = (direction + 1) % 2;   
           break;
         case 'T': // draw a five-petal flower 
           t.forward(dist);
           t.penUp();
           t.forward(dist);
           t.penDown();
           for (int j=0; j<6; j++) {
             for (int k=0; k<12; k++) {
               t.forward(dist/4);
               t.left(360/12);
             }
             t.left(360/6);
           }
           break;
         default:
           // Throw an error if we don't have a draw operation implemented 
           throw new IllegalArgumentException("Missing a drawing operation case for character: " + c.toString());  
       }
    }
  }
}

void drawSlantedAlternatingLeaf(Turtle t, int direction, float rotateAngle, float dist) {
  // this part ensures that a leaf will grow in alternating direction 
   if ((direction % 2) == 0) {
     t.left(rotateAngle);
     t.forward(dist);
     pushMatrix();
     translate(t.getX(), t.getY());
     rotate(rotateAngle * PI / 90 );
     ellipse(0, 0, dist, 15);
     popMatrix();
   } else {
     t.right(rotateAngle);
     t.forward(dist);
     pushMatrix();
     translate(t.getX(), t.getY());
     rotate(-1 * rotateAngle * PI / 90 );
     ellipse(0, 0, dist, 15);
     popMatrix();
  }
}

void drawSideGrowingLeaf(Turtle t, float dist) {
  pushMatrix();
  translate(t.getX()-dist/2, t.getY());
  ellipse(0, 0, dist, 15);
  popMatrix();
  
  pushMatrix();
  translate(t.getX()+dist/2, t.getY());
  ellipse(0, 0, dist, 15);
  popMatrix();
}
