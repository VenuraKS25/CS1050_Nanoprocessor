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
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector (11 downto 0);

signal instruction_rom : rom_type := (
    "100010001010", --0     MOVI R1,10 
    "100100000001", --1     MOVI R2,1
    "010100000000", --2     NEG R2
    "000010100000", --3     ADD R1 <- R1 + R2 
    "110010000111", --4     JZR R1,7
    "000000000000", --5     
    "000000000000", --6
    "110000000011"  --7     JZR R0,3
);

begin

data <= instruction_rom(to_integer(unsigned(address)));

end Behavioral;
