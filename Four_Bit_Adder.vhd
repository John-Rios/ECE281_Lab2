----------------------------------------------------------------------------------
-- Section: T6
-- Engineer: John Rios
-- 
-- Create Date:    13:02:36 02/18/2014 
-- Design Name:    Four Bit Adder
-- Module Name:    Four_Bit_Adder - Structural 
-- Project Name:   Lab 2
-- Target Devices: 
-- Tool versions: 
-- Description:   
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

entity Four_Bit_Adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           S : out  STD_LOGIC_VECTOR (3 downto 0);
			  Overflow : out STD_LOGIC;
			  Button : in STD_LOGIC); 	  
end Four_Bit_Adder;

architecture Structural of Four_Bit_Adder is

signal Carry, X : STD_LOGIC_VECTOR(3 downto 0);
signal C : STD_LOGIC;

component Full_Adder is
	port ( Cin : in  STD_LOGIC;
			  A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC);
end component Full_Adder;

begin

X <= not B when (Button = '1') else B; --When button is pushed B becomes negative for subtraction. X is simply a place holder for B whether B is positive or negative.
Carry(0) <= ('1') when (Button = '1') else ('0'); --When button is pushed, the first carry in equals one for a proper two's compliment conversion

Bit0: Full_Adder --first bit
	port map (Cin => Carry(0), -- Carry is a variable used to hold the value between the Cin and Cout of each adder
				 A => A(0),
				 B => X(0),
				 Cout => Carry(1),
				 S => S(0));
		
Bit1: Full_Adder --second bit
	port map (Cin => Carry(1),
				 A => A(1),
				 B => X(1),
				 Cout => Carry(2),
				 S => S(1));
		
Bit2: Full_Adder -- third bitt
	port map (Cin => Carry(2),
				 A => A(2),
				 B => X(2),
				 Cout => Carry(3),
				 S => S(2));

Bit3: Full_Adder -- fourth bit
	port map (Cin => Carry(3),
				 A => A(3),
				 B => X(3),
				 Cout => C, --Cout equals new variable 'C'. Used to help track overflow of arithmetic. 
				 S => S(3));
				 
Overflow <= C XOR Carry(3); --Detects overflow even if subtraction or addition between negative two's compliemtn numbers occurs
				
end Structural;

