library ieee;
use ieee.std_logic_1164.all;

entity conversondisplay is -- entidade do conversor display
port(
  CTRL      : in std_logic_vector(1 downto 0);
  Y      : in std_logic_vector(3 downto 0);
  DISPLAY		: out std_logic_vector(6 downto 0));
end conversondisplay;
 
architecture archConversor of conversondisplay is

signal display2 : std_logic_vector(6 downto 0);
begin
	WITH Y SELECT 
  
    display2 <=  not("1111110") WHEN "0000",
                 not("0110000") WHEN "0001",
                 not("1101101") WHEN "0010",
                 not("1111001") WHEN "0011",
                 not("0110011") WHEN "0100",
                 not("1011011") WHEN "0101",
                 not("1011111") WHEN "0110",
                 not("1110000") WHEN "0111",
                 not("1111111") WHEN "1000",
                 not("1111011") WHEN "1001",
					  not("1110111") WHEN "1010",
					  not("0011111") WHEN "1011",
					  not("1001110") WHEN "1100",
					  not("0111101") WHEN "1101",
					  not("1001111") WHEN "1110",
					  not("1000111") WHEN "1111",
					  not("0000000") WHEN OTHERS;
					  
		WITH CTRL SELECT
			
			DISPLAY <= display2 		  WHEN "00",
						  not("1001001") WHEN "01",
						  not("0000000") WHEN "10",
						  not("0000000") WHEN OTHERS;
					  
end archConversor;
