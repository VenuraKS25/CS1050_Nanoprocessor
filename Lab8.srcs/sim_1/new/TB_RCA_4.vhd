----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 10:33:32 PM
-- Design Name: 
-- Module Name: TB_RCA_4 - Behavioral
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

entity TB_RCA_4 is
--  Port ( );
end TB_RCA_4;

architecture Behavioral of TB_RCA_4 is

component RCA_4
    Port (
           M : in std_logic;
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC;
           Overflow : out std_logic
           );
end component;

signal M, A0, A1, A2, A3, B0, B1, B2, B3, S0, S1, S2, S3, C_out, Overflow : std_logic;

begin

    UUT: RCA_4 port map(
        M => M,
        A0 => A0,
        A1 => A1,
        A2 => A2,
        A3 => A3,
        B0 => B0,
        B1 => B1,
        B2 => B2,
        B3 => B3,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        S3 => S3,
        C_out => C_out,
        Overflow => Overflow
    );
    
    process begin
        M <= '0';
        --1101
        A0 <= '1';
        A1 <= '0';
        A2 <= '1';
        A3 <= '1';
        
        --0110
        B0 <= '0';
        B1 <= '1';
        B2 <= '1';
        B3 <= '0';
        
        wait for 100 ns;
        M <= '1';
        
        wait;  
    end process;
    
end Behavioral;
