library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_InstructionDecoder is
end TB_InstructionDecoder;

architecture Behavioral of TB_InstructionDecoder is

component InstructionDecoder
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
end component;

-- Declare the signals
signal InsBus : STD_LOGIC_VECTOR (11 downto 0);
signal RegChkJMP : STD_LOGIC_VECTOR (3 downto 0) := "0000";
signal RegEn : STD_LOGIC_VECTOR (2 downto 0);
signal RegReset : STD_LOGIC_VECTOR (2 downto 0);
signal LoadSel : STD_LOGIC;
signal ImmValue : STD_LOGIC_VECTOR (3 downto 0);
signal RegSelMux_1 : STD_LOGIC_VECTOR (2 downto 0);
signal RegSelMux_2 : STD_LOGIC_VECTOR (2 downto 0);
signal AddSubSel : STD_LOGIC;
signal JumpFlag : STD_LOGIC;
signal JMPAddress : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT: InstructionDecoder port map(
    InsBus => InsBus,
    RegChkJMP => RegChkJMP,
    RegEn => RegEn,
    RegReset => RegReset,
    LoadSel => LoadSel,
    ImmValue => ImmValue,
    RegSelMux_1 => RegSelMux_1,
    RegSelMux_2 => RegSelMux_2,
    AddSubSel => AddSubSel,
    JumpFlag => JumpFlag,
    JMPAddress => JMPAddress
);

    process begin
        InsBus <= "100010001010";
        wait for 60 ns;
        InsBus <= "100100000001";
        wait for 60 ns;
        InsBus <= "010100000000";
        wait for 60 ns;
        InsBus <= "000010100000";
        wait for 60 ns;
        InsBus <= "110000000111";
        wait;
    end process;

end Behavioral;
