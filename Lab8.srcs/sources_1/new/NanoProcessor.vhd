
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NanoProcessor is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Instruction : in std_logic_vector(11 downto 0);
           RegLedOut : out STD_LOGIC_VECTOR (3 downto 0);
           RegLedOut_R0 : out std_logic_vector(3 downto 0);
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC);
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component RegBank
    port(
        EN : in STD_LOGIC_VECTOR (2 downto 0);
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
        R7 : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component RCA_4
    port(
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
        Zero : out std_logic;
        Overflow : out std_logic
    );
end component;

component ROM
    port(
        address : in STD_LOGIC_VECTOR (3 downto 0);
        data : out STD_LOGIC_VECTOR (11 downto 0)
    );
end component;


component RCA_3
    port(
        A0 : in STD_LOGIC;
        A1 : in STD_LOGIC;
        A2 : in STD_LOGIC;
        S0 : out STD_LOGIC;
        S1 : out STD_LOGIC;
        S2 : out STD_LOGIC;
        C_out : out STD_LOGIC
    );
end component;

component Counter
    port(
        Jump : in std_logic_vector(2 downto 0);
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

component MUX_8_way_4_bit
    port(
        D0 : in STD_LOGIC_VECTOR (3 downto 0);
        D1 : in STD_LOGIC_VECTOR (3 downto 0);
        D2 : in STD_LOGIC_VECTOR (3 downto 0);
        D3 : in STD_LOGIC_VECTOR (3 downto 0);
        D4 : in STD_LOGIC_VECTOR (3 downto 0);
        D5 : in STD_LOGIC_VECTOR (3 downto 0);
        D6 : in STD_LOGIC_VECTOR (3 downto 0);
        D7 : in STD_LOGIC_VECTOR (3 downto 0);
        M_in : in STD_LOGIC_VECTOR (2 downto 0);
        M_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component InstructionDecoder
    port(InsBus : in STD_LOGIC_VECTOR (11 downto 0);
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

component MUX
    Port (
        D0 : in STD_LOGIC_VECTOR (3 downto 0);
        D1 : in STD_LOGIC_VECTOR (3 downto 0);
        L_sel : in STD_LOGIC;
        M_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal RegOut_0 : std_logic_vector(3 downto 0);
signal RegOut_1 : std_logic_vector(3 downto 0);
signal RegOut_2 : std_logic_vector(3 downto 0);
signal RegOut_3 : std_logic_vector(3 downto 0);
signal RegOut_4 : std_logic_vector(3 downto 0);
signal RegOut_5 : std_logic_vector(3 downto 0);
signal RegOut_6 : std_logic_vector(3 downto 0);
signal RegOut_7 : std_logic_vector(3 downto 0);
signal Mux0_Out : std_logic_vector(3 downto 0);
signal Mux1_Out : std_logic_vector(3 downto 0);
signal RCA4_Out : std_logic_vector(3 downto 0);
signal RCA4_COut : std_logic;
signal RCA4_Overflow : std_logic;
signal RCA4_Zero : std_logic;

signal Clock : std_logic;
signal InsImmValue : std_logic_vector(3 downto 0);
signal InsLoadSel : std_logic;
signal ValueToRegBank : std_logic_vector(3 downto 0);

signal Instruction_s : std_logic_vector(11 downto 0);
signal InsRegSel : std_logic_vector(2 downto 0);
signal InsResetRegSel : std_logic_vector(2 downto 0);
signal InsRegSelMux_1 : std_logic_vector(2 downto 0);
signal InsRegSelMux_2 : std_logic_vector(2 downto 0);
signal InsAddSubSel : std_logic;
signal InsJumpFlag : std_logic;
signal InsJMPAddress : std_logic_vector(2 downto 0);
signal Reset_s : std_logic;

begin

    RegBank_0 : RegBank port map(
        EN => InsRegSel, -- edit
        Clk => Clock, -- edit
        RegData => ValueToRegBank, -- edit
        Reset => Reset_s, -- edit
        ResetReg => InsResetRegSel,
        R0 => RegOut_0,
        R1 => RegOut_1,
        R2 => RegOut_2,
        R3 => RegOut_3,
        R4 => RegOut_4,
        R5 => RegOut_5,
        R6 => RegOut_6,
        R7 => RegOut_7
    );
    
    MUX_8_way_4_bit_0 : MUX_8_way_4_bit port map
    (
        D0 => RegOut_0,
        D1 => RegOut_1,
        D2 => RegOut_2,
        D3 => RegOut_3,
        D4 => RegOut_4,
        D5 => RegOut_5,
        D6 => RegOut_6,
        D7 => RegOut_7,
        M_in => InsRegSelMux_1, --edit
        M_out => Mux0_Out
    );
    
    MUX_8_way_4_bit_1 : MUX_8_way_4_bit port map
    (
        D0 => RegOut_0,
        D1 => RegOut_1,
        D2 => RegOut_2,
        D3 => RegOut_3,
        D4 => RegOut_4,
        D5 => RegOut_5,
        D6 => RegOut_6,
        D7 => RegOut_7,
        M_in => InsRegSelMux_2, --edit
        M_out => Mux1_Out
    );
    
    RCA_4_0 : RCA_4 port map
    (
       M => '0',
       A0 => Mux0_Out(0),
       A1 => Mux0_Out(1),
       A2 => Mux0_Out(2),
       A3 => Mux0_Out(3),
       B0 => Mux1_Out(0),
       B1 => Mux1_Out(1),
       B2 => Mux1_Out(2),
       B3 => Mux1_Out(3),
       S0 => RCA4_Out(0),
       S1 => RCA4_Out(1),
       S2 => RCA4_Out(2),
       S3 => RCA4_Out(3),
       C_out => RCA4_COut,
       Overflow => RCA4_Overflow,
       Zero => RCA4_Zero 
    );
    
    MUX_2_way_4_bit : MUX port map
    (
        D1 => RCA4_Out,
        D0 => InsImmValue,
        L_sel => InsLoadSel,
        M_Out => ValueToRegBank
    );
    
    InstructionDecoder_0 : InstructionDecoder port map
    (
        InsBus => Instruction_s,
        RegChkJMP => "0000",
        RegEn => InsRegSel,
        RegReset => InsResetRegSel,
        LoadSel => InsLoadSel,
        ImmValue => InsImmValue,
        RegSelMux_1 => InsRegSelMux_1,
        RegSelMux_2 => InsRegSelMux_2,
        AddSubSel => InsAddSubSel,
        JumpFlag => InsJumpFlag,
        JMPAddress => InsJMPAddress
    );
    
--    process is begin
--        assert false
--            report "Imm Value : " & integer'image(to_integer(InsImmValue))
--            severity note;
--        wait;
--    end process;
    
    Clock <= Clk;
    
    Reset_s <= Reset;
    Instruction_s <= Instruction;
    RegLedOut <= RegOut_7;
    RegLedOut_R0 <= RegOut_0;
    Zero <= RCA4_Zero;
    Overflow <= RCA4_Overflow;
end Behavioral;
