----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 07:19:41 PM
-- Design Name: 
-- Module Name: RegBank - Behavioral
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

entity RegBank is
    Port ( EN : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           RegData : in STD_LOGIC_VECTOR (3 downto 0);
           Reset : in std_logic;
           ResetReg : in std_logic_vector(2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end RegBank;

architecture Behavioral of RegBank is

component Reg
    port(
     D : in STD_LOGIC_VECTOR (3 downto 0);
     EN : in STD_LOGIC;
     Clk : in STD_LOGIC;
     Q : out STD_LOGIC_VECTOR (3 downto 0);
     Reset : in std_logic
    );
end component;

component Decoder_3_to_8
    port(
    I : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (7 downto 0)
    );
end component;
signal A, R_0, R_1, R_2, R_3, R_4, R_5, R_6, R_7 : std_logic_vector(3 downto 0);
signal DecOut_0 : std_logic_vector(7 downto 0);
signal DecOut_1 : std_logic_vector(7 downto 0);
signal RegSel : std_logic_vector(2 downto 0);
signal ResetRegSel : std_logic_vector(2 downto 0);
signal Res : std_logic;
signal Res_R0, Res_R1, Res_R2, Res_R3, Res_R4, Res_R5, Res_R6, Res_R7 : std_logic;

begin

--    process(Res) begin
--        if Res = '1' then
--            DecOut_1 <= "11111111";
--        end if;
--    end process;
    
    
    Decoder_3_to_8_0 : Decoder_3_to_8 port map(
        I => RegSel,
        EN => '1',
        Y => DecOut_0
    );
    
    Decoder_3_to_8_1 : Decoder_3_to_8 port map(
        I => ResetRegSel,
        EN => '1',
        Y => DecOut_1
        );
    
    
    Reg_0 : Reg port map(
        D => A,
        EN => DecOut_0(0),
        Clk => Clk,
        Q => R_0,
        Reset => Res_R0
    );
    Reg_1 : Reg port map(
        D => A,
        EN => DecOut_0(1),
        Clk => Clk,
        Q => R_1,
        Reset => Res_R1
    );
    Reg_2 : Reg port map(
        D => A,
        EN => DecOut_0(2),
        Clk => Clk,
        Q => R_2,
        Reset => Res_R2
    );
    Reg_3 : Reg port map(
        D => A,
        EN => DecOut_0(3),
        Clk => Clk,
        Q => R_3,
        Reset => Res_R3
    );
    Reg_4 : Reg port map(
        D => A,
        EN => DecOut_0(4),
        Clk => Clk,
        Q => R_4,
        Reset => Res_R4
    );
    Reg_5 : Reg port map(
        D => A,
        EN => DecOut_0(5),
        Clk => Clk,
        Q => R_5,
        Reset => Res_R5
    );
    Reg_6 : Reg port map(
        D => A,
        EN => DecOut_0(6),
        Clk => Clk,
        Q => R_6,
        Reset => Res_R6
    );
    Reg_7 : Reg port map(
        D => A,
        EN => DecOut_0(7),
        Clk => Clk,
        Q => R_7,
        Reset => Res_R7
    );
   
   Res_R0 <= DecOut_1(0) OR Res;
   Res_R1 <= DecOut_1(1) OR Res;
   Res_R2 <= DecOut_1(2) OR Res;
   Res_R3 <= DecOut_1(3) OR Res;
   Res_R4 <= DecOut_1(4) OR Res;
   Res_R5 <= DecOut_1(5) OR Res;
   Res_R6 <= DecOut_1(6) OR Res;
   Res_R7 <= DecOut_1(7) OR Res; 
    
    A <= RegData;
    RegSel <= EN;
    Res <= Reset;
    ResetRegSel <= ResetReg;
    R0 <= R_0;
    R1 <= R_1;
    R2 <= R_2;
    R3 <= R_3;
    R4 <= R_4;
    R5 <= R_5;
    R6 <= R_6;
    R7 <= R_7;
end Behavioral;
