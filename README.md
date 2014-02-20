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
	The final task involved creating a way to track and alert the user when overflow occured during the arithmatic. 

