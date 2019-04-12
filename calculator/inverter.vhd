library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;

entity inverter is
port (
	A: in std_logic_vector(3 downto 0);
	S: out std_logic_vector(3 downto 0)
	);
end inverter;

architecture Behavior of inverter is
begin
S(0) <= not (A(0));
S(1) <= not (A(1));
S(2) <= not (A(2));
S(3) <= not (A(3));
end Behavior ;