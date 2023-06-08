----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 08:41:20 PM
-- Design Name: 
-- Module Name: TB_RegBank - Behavioral
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

entity TB_RegBank is
--  Port ( );
end TB_RegBank;

architecture Behavioral of TB_RegBank is

component RegBank
    port(
        EN : in STD_LOGIC_VECTOR (2 downto 0);
        Clk : in STD_LOGIC;
        RegData : in STD_LOGIC_VECTOR (3 downto 0);
        R0 : out STD_LOGIC_VECTOR (3 downto 0);
        R1 : out STD_LOGIC_VECTOR (3 downto 0);
        R2 : out STD_LOGIC_VECTOR (3 downto 0);
        R3 : out STD_LOGIC_VECTOR (3 downto 0);
        R4 : out STD_LOGIC_VECTOR (3 downto 0);
        R5 : out STD_LOGIC_VECTOR (3 downto 0);
        R6 : out STD_LOGIC_VECTOR (3 downto 0);
        R7 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal EN_0 : std_logic_vector(2 downto 0);
signal Clk_in : std_logic := '1';
signal A, R_0, R_1, R_2, R_3, R_4,  R_5,  R_6 , R_7 : std_logic_vector(3 downto 0);

begin

    UUT: RegBank port map(
        EN => EN_0,
        RegData => A,
        Clk => Clk_in,
        R0 => R_0,
        R1 => R_1,
        R2 => R_2,
        R3 => R_3,
        R4 => R_4,
        R5 => R_5,
        R6 => R_6,
        R7 => R_7
    );
    
    process begin
        wait for 50 ns;
        Clk_in <= NOT Clk_in;
    end process;
    
    process begin
      wait for 75 ns;
      A <= "0000";
      EN_0 <= "000";
      wait for 50 ns;
      A <= "0001";
      EN_0 <= "001";
      wait;     
    end process;


end Behavioral;
