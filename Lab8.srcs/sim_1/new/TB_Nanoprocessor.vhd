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
        RegLedOut : out STD_LOGIC_VECTOR (3 downto 0);
        Instruction : out std_logic_vector(11 downto 0);
        MUXOut : out std_logic_vector(3 downto 0);
        Zero : out STD_LOGIC;
        Overflow : out STD_LOGIC;
        NextValue : out std_logic_vector(2 downto 0)
    );
end component;

signal Clk : std_logic := '1';
signal Reset : std_logic := '0';
signal RegLedOut : std_logic_vector(3 downto 0); 
signal Zero : std_logic;
signal Overflow : std_logic;
signal Instruction : std_logic_vector(11 downto 0);
signal MUXOut : std_logic_vector(3 downto 0);
signal NextValue : std_logic_vector(2 downto 0);

begin
    UUT: NanoProcessor port map(
        Clk => Clk,
        Reset => Reset,
        RegLedOut => RegLedOut,
        Overflow => Overflow,
        Instruction => Instruction,
        MUXOut =>  MUXOut,
        NextValue => NextValue
    );
    
    process begin
        wait for 40 ns;
        Clk <= not Clk;
    end process;
    
    process begin
        wait for 60 ns;
        Reset <= '1';
        wait for 80 ns;
        Reset <= '0';
        wait;
--        Instruction <= "101110000001";
--        wait for 60 ns;
--        Instruction <= "101100000010";
--        wait for 60 ns;
--        Instruction <= "101010000011";
--        wait for 60 ns;
--        Instruction <= "001111100000";
--        wait for 60 ns;
--        Instruction <= "001111010000";
--        wait for 60 ns;
--        Instruction <= "110000000000";
--        wait;
    end process;


end Behavioral;
