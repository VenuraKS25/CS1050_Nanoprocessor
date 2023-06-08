----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 03:15:12 PM
-- Design Name: 
-- Module Name: TB_Nanoprocessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_Nanoprocessor is
--  Port ( );
end TB_Nanoprocessor;

architecture Behavioral of TB_Nanoprocessor is

component NanoProcessor
    Port ( 
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Instruction : in std_logic_vector(11 downto 0);
        RegLedOut : out STD_LOGIC_VECTOR (3 downto 0);
        RegLedOut_R0 : out std_logic_vector (3 downto 0);
        Zero : out STD_LOGIC;
        Overflow : out STD_LOGIC
    );
end component;

signal Clk : std_logic := '1';
signal Reset : std_logic := '0';
signal RegLedOut : std_logic_vector(3 downto 0);
signal RegLedOut_R0 : std_logic_vector(3 downto 0);
signal Instruction : std_logic_vector(11 downto 0); 
signal Zero : std_logic;
signal Overflow : std_logic;

begin
    UUT: NanoProcessor port map(
        Clk => Clk,
        Reset => Reset,
        Instruction => Instruction, 
        RegLedOut => RegLedOut,
        RegLedOut_R0 => RegLedOut_R0,
        Overflow => Overflow
    );
    
    process begin
        wait for 30 ns;
        Clk <= not Clk;
    end process;
    
    process begin
        wait for 45 ns;
        Instruction <= "101110001010";
        wait for 60 ns;
        Instruction <= "100000001010";
        wait for 60 ns;
        Instruction <= "001110000000";
        wait for 60 ns;
        Instruction <= "011110000000";
--        wait for 60 ns;
--        Instruction <= "UUUUUUUUUUUU";
        wait;
    end process;


end Behavioral;
