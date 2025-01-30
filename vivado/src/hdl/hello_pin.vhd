library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hello_pin is
  port (
    OUT_A            : out std_logic;
    OUT_B            : out std_logic    
    );
end;

architecture behavioral of hello_pin is
begin
  OUT_A <= '1';
  OUT_B <= '0';
end;
