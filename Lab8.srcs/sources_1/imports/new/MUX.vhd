----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 11:31:24 PM
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX is
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           L_sel : in STD_LOGIC;
           M_out : out STD_LOGIC_VECTOR (3 downto 0));
end MUX;

architecture Behavioral of MUX is

signal D_out_0,D_out_1,A_0,A_1 : STD_LOGIC_VECTOR (3 downto 0);


begin
    A_0 <= (others => L_sel);
    A_1 <= (others => not L_sel);
    
    D_out_0 <= A_0 AND D0;
    D_out_1 <= A_1 AND D1;
    
    M_out <= D_out_0 OR D_out_1;

end Behavioral;
