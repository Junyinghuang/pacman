library ieee;
use std.textio.all; -- Imports the standard textio package.
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity adc is
port (rst, clk, adc_of : in std_logic;
        adc_d : in std_logic_vector(11 downto 0);
        adc_en, adc_clk : out std_logic;
        dout : out std_logic_vector(31 downto 0));
end adc;

architecture bhv of adc is
begin
        adc_en <= '1';
        adc_clk <= not clk;
        
    process(clk, rst)
    begin
        if (rst = '1') then
            dout <= (others => '0');
        elsif (rising_edge(clk)) then
            dout(11 downto 0) <= adc_d;
            dout(12) <= adc_of;
            dout(16) <= '1';
        end if;
    end process;
end bhv;

