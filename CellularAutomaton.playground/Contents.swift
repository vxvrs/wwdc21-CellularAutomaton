import PlaygroundSupport
import UIKit

/*:
 ### WWDC21 Swift Student Challenge Submission - Viggo Overes
 
 # 1D Cellular Automata
 Cellular Automaton consist of a grid of cells where each cell has a specific state, e.g. black or white. Cellular automata can be studied because of it complex behavior out of simple local dynamics. Some cellular automata can even be used to model fundamental physics, e.g. gas particles.
 
 ![One-dimensional Cellular Automaton](1DCA.png)

 In the 1D cellular automaton I made each row is a state where the initial state is at the top and each row is a new state derived from the row above according to some rules. For each cell (i) a certain range (r) is used and this is called the neighborhood. This neighborhood is then used to determine the new state for i. This can be seen in the picture below.
 
 ![1D Cellular Automaton Row](CA-Row.png)
 
 For example: a range of 1 (r=1) results into a neighborhood of 3 cells. When you are looking at the 3 cells and use either a state of 0 or 1 then you’ll have 8 possible configurations (111, 110, 101, 100, 011, 010, 001, 000). Each of these configurations will result into a new state for the middle cell in this neighborhood. This can be seen in the picture below.
 
 ![Cellular Automaton Configurations](CA-config.png)
 
 You can see that for each configuration you will have in this case either a 1 or 0 as a new state for the cell. In the table you can see that all outputs can be written as one single 8-bit binary number. This is partly because the configurations used will remain the same for a specific range r used and thus the only thing that changes between models are the different outputs for each configurations. This binary number representing the outputs for each configurations can be converted to a decimal number and this number is called the rule or Wolfram code.
 
 ![Examples of rule 30 and 110 in table](Rules.png)
 
 The total number of valid rules are dependent on the range used and the number of possible configurations. With a range of 1 (r=1) you'll have a neighborhood of 3 (2r + 1). When the possible states are either 0 or 1 you'll have 8 possible configurations (2^(2r + 1)). The total number of rules is than equal to 256 (2 ^ (2 ^ (2r +1))) and the rule numbers range from 0 to 255.
 
 These rules can be classified into four Wolfram classes:
 - Class 1: This class starts with an initial pattern that results into a stable, homogeneous state. All randomness in the initial pattern disappears.
 - Class 2: This class starts with an initial pattern that results into a stable or oscillating structures. There will remain some randomness and local changes remain local.
 - Class 3: This class starts with an initial state that results into a pseudo-random or chaotic structure. Here stable structures are destroyed by noise.
 - Class 4: This class starts with an initial state that results into a complex structures that interact in interesting ways. This class can transform into a Class 2 after a long time. Some rules are even capable of universal computation.
 
 Examples rules with r = 1 can be found below and I suggest trying them all out and see the difference for yourself! You can also just fill in a random number for a rule and try to determine what kind of class this would be. You’ll see when trying out different rules for yourself that some are quite dull while others can be really complex.
 
 Example rules for each class:
 - Class 1:     0, 32, 160, 250
 - Class 2:     4, 108, 218, 232
 - Class 3:     22, 30, 126, 150, 182
 - Class 4:     110
 
 Below you can change the size of the cellular automaton used, the range (and hereby it's neighborhood used), the rule number and weither you wan't the inital row to be random initiate or not. When you choose not to randomly initiate the cellular automaton the initial row will have a single state set to 1 in the middle. This can be helpful to see the structure from the given rule.
 */

var size = 100
var range = 1
var rule = 30
var random = false


// Code to make the model and display into a LiveView.
var view = CAView(size: size, cellSize: 5, r: range, rule: rule, randomSetup: random)
PlaygroundPage.current.setLiveView(view)

for _ in 0..<size {
    (PlaygroundPage.current.liveView as! CAView).step()
}
