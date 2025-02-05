library ieee;
use std.textio.all; -- Imports the standard textio package.
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

entity adc_tb is
end adc_tb;

architecture bhv of adc_tb is
    component adc
        port (rst, clk, adc_of: in std_logic;
                adc_d : in std_logic_vector(11 downto 0);
            adc_en, adc_clk: out std_logic;
                dout : out std_logic_vector(31 downto 0));
    end component;
    signal adc_d : std_logic_vector(11 downto 0) := (others => '0');
    signal rst : std_logic := '0';
    signal clk : std_logic := '0';
    signal adc_en : std_logic := '0';
    signal adc_clk : std_logic := '0';
    signal dout : std_logic_vector(31 downto 0);
    signal adc_of : std_logic := '0';
begin
    adc_0: adc port map (rst => rst, clk => clk, adc_d => adc_d, adc_en => adc_en, adc_clk => adc_clk, dout => dout, adc_of => adc_of);
    clock_process : process
    begin
        clk <= '1';
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
    end process;
    
    test_pattern_process : process(adc_clk)
        variable count : integer := 0;
        --variable l : line;
    begin
        if (rising_edge(adc_clk)) then
            --write (l, String'("test pattern count: "));
            --write (l, count);
            --writeline (output, l);
            count := (count + 1) mod 16#1000#;
            adc_d <= std_logic_vector(to_unsigned(count, adc_d'length));
            
        end if;
    end process;
    
    show_output_process: process
        variable l : line;
    begin
        write (l, String'("clk: "));
        write (l, clk);
        write (l, String'(" adc_en: "));
        write (l, adc_en);
        write (l, String'(" adc_clk: "));
        write (l, adc_clk);
        write (l, String'(" dout: 0x"));
        hwrite (l, dout);
        write (l, String'(" adc_of: "));
        write (l, adc_of);
        writeline (output, l);
        wait for 5 ns;
    end process;
end bhv;
