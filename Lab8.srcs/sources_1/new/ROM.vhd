----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 05:08:51 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector (11 downto 0);

signal instruction_rom : rom_type := (
    "101110000001", --0     MOVI R7,1 
    "101100000010", --1     MOVI R6,2
    "101010000011", --2     MOVI R5,3
    "001111100000", --3     ADD R7 <- R7 + R6 
    "001111010000", --4     ADD R7 <- R7 + R5
    "110000000000", --5     JZR R0,0
    "000000000000", --6
    "000000000000"  --7     
);

begin

data <= instruction_rom(to_integer(unsigned(address)));

end Behavioral;
