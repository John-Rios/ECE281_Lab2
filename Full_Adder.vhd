----------------------------------------------------------------------------------
-- Section: T6 
-- Engineer: John Rios
-- 
-- Create Date:    15:45:50 02/10/2014 
-- Design Name: 	 My Lab 2
-- Module Name:    Full_Adder - Behavioral 
-- Project Name: 	 Lab 2
-- Target Devices: 
-- Tool versions: 
-- Description: 	 Lab 2 is a full adder.  
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is
    Port ( Cin : in  STD_LOGIC;
			  A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

signal A_Not, B_Not, Cin_Not, S1, S2, S3, S4, S5, S6, S7, S8, C1, C2, C3: STD_LOGIC;

begin

A_Not <= not A;
B_Not <= not B;
Cin_Not <= not Cin;

S1 <= A_Not and B;
S2 <= A and B_Not;
S3 <= A and B;
S4 <= A_Not and B_Not;
S5 <= S1 and Cin_Not;
S6 <= S2 and Cin_Not;
S7 <= S3 and Cin;
S8 <= S4 and Cin;
S <= S5 or S6 or S7 or S8;

C1 <= A and B;
C2 <= B and Cin;
C3 <= A and Cin;
Cout <= C1 or C2 or C3;

end Behavioral;

