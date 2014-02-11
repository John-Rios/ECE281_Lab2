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

![Prelab_Waveform] (https://raw.github.com/John-Rios/ECE281_Lab2/master/testbench_prelab_waveform.png)


Bugs/Errors Encountered:
	Initially I coded my VHDL with switched outputs. My S responded how my COUT while my COUT responded how my S output should have responded. I realized I switched my code. I ran into one other error when I checked the syntax. I misnamed CIN as simply C. Once I corrected this error and correctly labeled my outputs, my code worked as expected. 

