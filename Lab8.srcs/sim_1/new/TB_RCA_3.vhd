----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 11:26:17 PM
-- Design Name: 
-- Module Name: TB_RCA_3 - Behavioral
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

entity TB_RCA_3 is
--  Port ( );
end TB_RCA_3;

architecture Behavioral of TB_RCA_3 is

component RCA_3
    Port (
        A0 : in STD_LOGIC;
        A1 : in STD_LOGIC;
        A2 : in STD_LOGIC;
        S0 : out STD_LOGIC;
        S1 : out STD_LOGIC;
        S2 : out STD_LOGIC;
        C_out : out STD_LOGIC
    );
end component;

signal A0, A1, A2, S0, S1, S2, C_out : std_logic;
begin

    UUT: RCA_3 port map(
        A0 => A0,
        A1 => A1,
        A2 => A2,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        C_out => C_out
    );
    
    process begin
        A0 <= '0';
        A1 <= '0';
        A2 <= '0';
        
        wait for 100 ns;
        A0 <= '0';
        A1 <= '1';
        A2 <= '0';
        wait;
        
    end process;

end Behavioral;
