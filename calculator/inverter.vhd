library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;

-- declaring entity
entity inverter is 
port (
	A: in std_logic_vector(3 downto 0); -- vector input
	S: out std_logic_vector(3 downto 0) -- vector output
	);
end inverter;

-- declaring architecture
architecture Behavior of inverter is --bitwise inverter
begin
S(0) <= not (A(0)); -- inversing A(0)
S(1) <= not (A(1)); -- inversing A(1)
S(2) <= not (A(2)); -- inversing A(2)
S(3) <= not (A(3)); -- inversing A(3)
end Behavior ;