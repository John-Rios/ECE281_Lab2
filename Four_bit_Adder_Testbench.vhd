--------------------------------------------------------------------------------
-- Section: T6
-- Engineer: John Rios
--
-- Create Date:   14:46:44 02/18/2014
-- Design Name:   
-- Module Name:   C:/Users/C15John.Rios/Documents/ECE281/Lab2_Rios/Four_bit_Adder_Testbench.vhd
-- Project Name:  Lab2_Rios
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Four_Bit_Adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Four_bit_Adder_Testbench IS
END Four_bit_Adder_Testbench;
 
ARCHITECTURE behavior OF Four_bit_Adder_Testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Four_Bit_Adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         S : OUT  std_logic_vector(3 downto 0);
         Button : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal Button : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 --  constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Four_Bit_Adder PORT MAP (
          A => A,
          B => B,
          S => S,
          Button => Button
        );
 

   -- Stimulus process
   stim_proc: process
	
   begin		
	
--Addition Test Bench Section
		A <= "0000";
		B <= "0000";
		Button <= '0';
		
		--All Values of 'A'
		for X in 0 to 15 loop
			--All Values of 'B'
			for Y in 0 to 15 loop
				--Allow time for output to update
				wait for 5ns;
				--Find and report the sum value
				assert S = A + B;
				
			--Increase value of B for each repetition of the loop
			--VHDL counts in binary acording to google. this is really cool
			B <= B + "0001"; 
			end loop;
		--Increase value of A for each repetition of the loop
		A <= A + "0001";
		end loop;
		
		report "Four Bit Adder Test is Finished";
		report "more to follow...";
		
		
-- Subtraction Test Bench Section		
		A <= "0000";
		B <= "0000";
		Button <= '1';
		
		--All Values of 'A'
		for Z in 0 to 15 loop
			--All Values of 'B'
			for W in 0 to 15 loop
				--Allow time for output to update
				wait for 5ns;
				--Find and report the sum value
				assert S = A - B;
				
			--Increase value of B for each repetition of the loop
			B <= B + "0001";
			end loop;
		--Increase value of A for each repetition of the loop
		A <= A + "0001";
		end loop;
		
		report "Four Bit Subtractor Test is Finished";
		report "Have a great day!";

      wait;
   end process;

END;
