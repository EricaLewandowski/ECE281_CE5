--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:26:21 04/30/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Erica.Lewandowski/Documents/School/Spring 2014/ECE 281/Xilinx/CE5/Ce5_tb.vhd
-- Project Name:  CE5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mips
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Ce5_tb IS
END Ce5_tb;
 
ARCHITECTURE behavior OF Ce5_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mips
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         pc : INOUT  std_logic_vector(31 downto 0);
         instr : IN  std_logic_vector(31 downto 0);
         memwrite : OUT  std_logic;
         aluout : INOUT  std_logic_vector(31 downto 0);
         writedata : INOUT  std_logic_vector(31 downto 0);
         readdata : IN  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal instr : std_logic_vector(31 downto 0) := (others => '0');
   signal readdata : std_logic_vector(31 downto 0) := (others => '0');

	--BiDirs
   signal pc : std_logic_vector(31 downto 0);
   signal aluout : std_logic_vector(31 downto 0);
   signal writedata : std_logic_vector(31 downto 0);

 	--Outputs
   signal memwrite : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mips PORT MAP (
          clk => clk,
          reset => reset,
          pc => pc,
          instr => instr,
          memwrite => memwrite,
          aluout => aluout,
          writedata => writedata,
          readdata => readdata
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      instr <= "00100000000100000000000000101100"; --insert hex instruction
      wait for 100 ns;	
		instr <= "00100010001000001111111110111111";--next instruction 
      wait for 100 ns;
		instr <= "00000010010100001000100000100000";
		wait for 100ns;
		instr <= "10101110011000000000000010011000";
      -- insert stimulus here 

      wait;
   end process;

END;
