----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 10:42:14 AM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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

entity InstructionDecoder is
    Port ( InsBus : in STD_LOGIC_VECTOR (11 downto 0);
           RegChkJMP : in STD_LOGIC_VECTOR (3 downto 0);
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           RegReset : out std_logic_vector(2 downto 0);
           LoadSel : out STD_LOGIC;
           ImmValue : out STD_LOGIC_VECTOR (3 downto 0);
           RegSelMux_1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSelMux_2 : out STD_LOGIC_VECTOR (2 downto 0);
           AddSubSel : out STD_LOGIC;
           JumpFlag : out STD_LOGIC;
           JMPAddress : out STD_LOGIC_VECTOR (2 downto 0));
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

signal instruction : std_logic_vector(11 downto 0);
signal regCheckJMP_s : std_logic_vector(3 downto 0);
signal regEn_s       : std_logic_vector(2 downto 0);
signal regReset_s : std_logic_vector(2 downto 0);
signal loadSel_s     : std_logic;
signal immValue_s    : std_logic_vector(3 downto 0);
signal regSelMux_1_s : std_logic_vector(2 downto 0);
signal regSelMux_2_s : std_logic_vector(2 downto 0);
signal addSubSel_s   : std_logic;
signal jumpFlag_s    : std_logic;
signal jmpAddress_s  : std_logic_vector(2 downto 0) := "000";

signal insType : std_logic_vector(1 downto 0);
signal regA : std_logic_vector(2 downto 0);
signal regB : std_logic_vector(2 downto 0);
signal immediateVal : std_logic_vector(3 downto 0);

begin
    
    instruction <= InsBus;
    insType <= instruction(11 downto 10);
    regA <= instruction(9 downto 7);
    regB <= instruction(6 downto 4);
    immediateVal <= instruction(3 downto 0);
    
    process(InsType, regA, regB, immediateVal, regCheckJMP_s)
     begin
     --regEn_s <= "000";
        jumpFlag_s <= '0';
        regReset_s <= "000";
        regSelMux_2_s <= regA;
        if insType = "00" then
            addSubSel_s <= '0';
            regSelMux_1_s <= regA;
            regSelMux_2_s <= regB;
            loadSel_s <= '0'; 
            regEn_s <= regA;    
        elsif insType = "10" then
            immValue_s <= immediateVal;
            loadSel_s <= '1';
            regEn_s <= regA;        
        elsif insType = "01" then
            addSubSel_s <= '1';
            regReset_s <= regB;
            regSelMux_1_s <= regB;
            regSelMux_2_s <= regA;
            loadSel_s <= '0';
            regEn_s <= regA; 
        elsif insType = "11" then
            if regCheckJMP_s = "0000" then
                jmpAddress_s <= immediateVal(2 downto 0);
                jumpFlag_s <= '1';
            end if; 
        end if;
    end process;
    
    regCheckJMP_s <= RegChkJMP;
    RegEn <= regEn_s;
    RegReset <= regReset_s;
    LoadSel <= loadSel_s;
    ImmValue <= immValue_s;
    RegSelMux_1 <= regSelMux_1_s;
    RegSelMux_2 <= regSelMux_2_s;
    AddSubSel <= addSubSel_s;
    JumpFlag <= jumpFlag_s;
    JMPAddress <= jmpAddress_s;
end Behavioral;
