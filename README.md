(I uploaded before the start of class. However, today there was a delayed start so the start time of class is later than usual. )


ECE281_Lab2
===========
|Inputs----------------|-----------Outputs|

|CIN | A | B | COUT | S |
|:-:|:-:|:-:|:-:|:-:|
| 0 |	0	| 0 |	0	| 0 |
| 0	| 0	| 1	| 0	| 1 |
| 0	| 1	| 0	| 0	| 1 |
| 0	| 1	| 1	| 1	| 0 |
| 1	| 0	| 0	| 0	| 1 | 
| 1	| 0	| 1	| 1	| 0 |
| 1 | 1	| 0	| 1	| 0 |
| 1 | 1 | 1 | 1 | 1 |

Output Equation:
COUT = CIN’AB + CINA’B + CINAB’ + CINAB

S = CIN’A’B + CIN’AB’ + CINA’B’ + CINAB

Karnaugh Mapping:
(Hard copies in notebook)

Schematics for both outputs:
Cout
![Cout] (https://raw.github.com/John-Rios/ECE281_Lab2/master/Cout_schematic.png)

S
![S] (https://raw.github.com/John-Rios/ECE281_Lab2/master/S_schematic.png)

Full Adder Interface:
(Image included in notebook)

Simulation Results:

(initially wrong)

|CIN | A | B | COUT | S |
|:-:|:-:|:-:|:-:|:-:|
| 0 |	0	| 0 |	0	| 0 |
| 0	| 0	| 1	| 1	| 0 |
| 0	| 1	| 0	| 1	| 0 |
| 0	| 1	| 1	| 0	| 1 |
| 1	| 0	| 0	| 1	| 0 | 
| 1	| 0	| 1	| 0	| 1 |
| 1 | 1	| 0	| 0	| 1 |
| 1 | 1 | 1 | 1 | 1 |

Initially my simulation results were incorrect. My COUT and S outputs were switched. When I looked back on my code I realized that I switched the two outputs. I switched the outputs when labeling my schematic and then created my code off of that schematic. This was a very simple fix as all I had to do was re-label my schematic and the code for my outputs. After correcting my typos, my simulation resulted in the expected outcomes. 

(Simulation results after correcting the bug)

|CIN | A | B | COUT | S |
|:-:|:-:|:-:|:-:|:-:|
| 0 |	0	| 0 |	0	| 0 |
| 0	| 0	| 1	| 0	| 1 |
| 0	| 1	| 0	| 0	| 1 |
| 0	| 1	| 1	| 1	| 0 |
| 1	| 0	| 0	| 0	| 1 | 
| 1	| 0	| 1	| 1	| 0 |
| 1 | 1	| 0	| 1	| 0 |
| 1 | 1 | 1 | 1 | 1 |

Simulation Waveform Results:

![Prelab] (https://raw.github.com/John-Rios/ECE281_Lab2/master/Testbench_prelab_waveform.png)


Bugs/Errors Encountered:
	Initially I coded my VHDL with switched outputs. My S responded how my COUT while my COUT responded how my S output should have responded. I realized I switched my code. I ran into one other error when I checked the syntax. I misnamed CIN as simply C. Once I corrected this error and correctly labeled my outputs, my code worked as expected. 
	

Lab Procedures and Design Process:
	I began my lab VHD code by reading the hints provided in the Lab 2 handout and implemetning the example code provided. This layed a solid foundation from which to begin. With a 1 bit adder already funstioning properly, to create the four bit adder I decided to use structural code to save time. I would simply reference my 1 bit adder four times in order to create the four bit adder. This is exactly how my code is structured. I begin with the first bit followed by three identical sections of code for the remaining three bits. A key aspect to the design of the four bit adder is that the Cout of the previous adder feeds into the Cin input of the next adder. I created a new variable to simply hold the value of each Cout so that I could more easily make the next Cout equal to that value. I used the vector Carry() to accomplish this task. By linking the four adders I had created a functonal four bit adder.
	Next came the design of converting the adder into a subtractor. This involved creating a way to invert 'B' so that we could add a positive 'A' to the negative 'B' which would be the same as subtracting 'B' from 'A'. A button would provide a temporary signal wich could be used to distinguish between when the user desired to add and subtract. I created a new input variable named 'Button' to track when the button was pressed. When the button was not pressed, I set the code to act as if there were no button. however, when the button was pressed, the code would make 'B' equal to the inverse value. To make 'B' a proper two's compliment negative number I needed to invert the number and add 1 bit to the value. I accomplished this by making the carry-in of the first adder equal to one. With a proper negative two's compliment 'B' value, we could add the negative 'B' to the positive 'A' value and perform proper subtraction.
	The final task involved creating a way to track and alert the user when overflow occured during the arithmatic. The first step of detecting overflow is simply knowing when overflow occurs. Overflow only occurs when the carry-in and carry-out values are not equal. This means that overflow follows the behavior of an exclusive OR gate. I used an XOR to compare the carry-out of the last adder to the carry-in of the last adder. 
	
Errors Encountered and Debugging:
	I ran into several errors while performing this lab. The first issue I encountered was that I was having difficulty  making thecary-out of one adder equal the carry-in of the next adder using the vector form of each. I resolved this issue by creating a new temporary variable that acted as a place holder. The variable 'Carry' would be set as the carry-out of each adder so that I could set the carry-in of the next adder to the value of the variable 'Carry'. This resolved the issue and simplified my code.
	The next error I encountered was when I was designing the subtractor. I converted 'B' to its inverse but forgot to add 1-bit to make it a proper two's compliment negative number. My results were continuously wrong until I realized that my negative numbers were off. By adding the 1-bit to the inverse of 'B' I was able to resolve this error.
	When designing the overflow detector I kept getting a syntax error that stopped my progress. My vector variable of Cout() was giving me the error when I tried to capture the value of the carry-out of the fourth bit. C2C Agnolutto helped me identify the error. I did not establish Cout(4) but was attempting to access it. I had only established the vector to hold values of 0-3. To resolve the error I created a new temproary variable named 'C' who's sole purpose was to capture the carry-out value of the fourth adder.
	When creating the four bit testbench I was running into an error which identified that the '+' and '-' symbols were not valid. Upon googling the error I realized that I was not using all of the required libraries in VHDL. Google helped me identify the correct libraries which corrected this error.
	With my four bit testbench I kept getting simulation results that depicted multiple unknown variables. My simulation results had several undesired variables and each one was undefined. I corected this error by reducing the demand on my simulation. I required only the sum to be outputed. This fixed my error. I am unsure what was causing the error but due to the solution, I believe it may have been caused by asking for unknown/undeclared inputs and outputs. 
	For my overflow detector I programmed it wrong. Dr. Neebal discussed a common error in class which led me to use a XOR gate to identify an overflow based on the carry in and the carry out of the last adder. 
	

Final Schematic:
	The following depicts the design of my four bit adder. The image is property of someone else (found on google) but shows exactly how my lab was designed. 
	
![FourBit] (https://raw.github.com/John-Rios/ECE281_Lab2/master/Adder_Subtractor_Schematic.png)
	
The following shows how each adder within the four bit adder was designed. My design is less simplified than others but mine is still operational. Both of the following outputs make up the design of one adder.
	
Schematics for both outputs:
Cout

![Cout] (https://raw.github.com/John-Rios/ECE281_Lab2/master/Cout_schematic.png)

S

![S] (https://raw.github.com/John-Rios/ECE281_Lab2/master/S_schematic.png)

Testbench Results for Four bit Adder/Subtractor:

![Cout] (https://raw.github.com/John-Rios/ECE281_Lab2/master/Four_Bit_Testbench_Waveform.JPG)

Documentation:
	I used my book, my notes, git-hub, google (specific sites unknown but used for quick reference), and C2C Agnolutto helped identify an error specified in my debugging section. 
