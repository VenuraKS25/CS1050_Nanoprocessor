library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Counter is
end TB_Counter;

architecture Behavioral of TB_Counter is

component Counter
    port(
        NextIns : in std_logic_vector(2 downto 0);
        Res : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0)
    );
end component;

signal NextIns : std_logic_vector(2 downto 0);
signal Clk : std_logic := '0';
signal Res : std_logic := '0';
signal Q : std_logic_vector (2 downto 0);
begin

    UUT : Counter port map(
        NextIns => NextIns,
        Res => Res,
        Clk => Clk,
        Q => Q
    );
    
    clock_process: process
    begin
        wait for 30 ns;
        Clk <= not Clk;
    end process;
    
    stimulus_process: process
    begin
        wait until rising_edge(Clk);  -- Wait for a rising edge
        Res <= '1';
        wait until rising_edge(Clk);  -- Wait for a rising edge
        NextIns <= "001";
        Res <= '0';
        wait until rising_edge(Clk);  -- Wait for a rising edge
        NextIns <= "010";
        wait until rising_edge(Clk);  -- Wait for a rising edge
        NextIns <= "011";
        wait until rising_edge(Clk);  -- Wait for a rising edge
        NextIns <= "100";
        wait until rising_edge(Clk);  -- Wait for a rising edge
        NextIns <= "101";
        wait until rising_edge(Clk);  -- Wait for a rising edge
        Res <= '1';
        wait until rising_edge(Clk);  -- Wait for a rising edge
        Res <= '0';
        wait until rising_edge(Clk);  -- Wait for a rising edge
        NextIns <= "010";
        wait until rising_edge(Clk);  -- Wait for a rising edge
        NextIns <= "011";
        wait until rising_edge(Clk);  -- Wait for a rising edge
        NextIns <= "100";
        wait until rising_edge(Clk);  -- Wait for a rising edge
        NextIns <= "101";
        wait;
    end process;
end Behavioral;


