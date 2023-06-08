----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 08:57:27 PM
-- Design Name: 
-- Module Name: TB_Counter - Behavioral
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

entity TB_Counter is
--  Port ( );
end TB_Counter;

architecture Behavioral of TB_Counter is

component Counter
    port(
        Jump : in std_logic_vector(2 downto 0);
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal Jump : std_logic_vector(2 downto 0) := "UUU";
signal Clk : std_logic := '1';
signal Res : std_logic := '0';
signal Q : std_logic_vector (2 downto 0);
begin

    UUT : Counter port map(
        Jump => Jump,
        Res => Res,
        Clk => Clk,
        Q => Q
    );
    
    process begin
        wait for 30 ns;
        Clk <= NOT Clk;
    end process;
    
    process begin
        wait for 45 ns;
        Res <= '1';
        wait for 30 ns;
        Res <= '0';
        wait;
    end process;
end Behavioral;
