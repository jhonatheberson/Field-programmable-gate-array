library ieee;
use ieee.std_logic_1164.all;

-- declaring entity
entity somador_completo is
port(
	a, b	: in std_logic; -- logic input
	cin	: in std_logic; -- logic input
	s		: out std_logic; -- logic output
	cout : out std_logic -- logic output
);
end somador_completo;

-- declaring architecture
architecture dataflow of somador_completo is -- addition of a bit
begin
	s <= a xor b xor cin; -- sum of one bit
	cout <= (a and b) or (a and cin) or (b and cin); -- goes one of the sum
end dataflow;
