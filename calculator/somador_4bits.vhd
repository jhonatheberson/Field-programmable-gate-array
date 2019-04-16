library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

-- declaring entity
entity somador_4bits is 
port(
	a,b: in std_logic_vector(3 downto 0); -- vectors input the 4 bits
	c0 : in std_logic; -- logic output 
	s  : out std_logic_vector(3 downto 0); -- vectors input the 4 bits, which is the sum
	c4 : out std_logic -- logic output, elevates one to make adder with more bits
	);
end somador_4bits;

-- declaring architecture
architecture estrutural of somador_4bits is
	signal vai_um : std_logic_vector(0 to 2); -- goes one bit by bit

	-- include component somador_completo
	component somador_completo is
	port(
		a,b	: in std_logic; -- logic inputs
		cin	: in std_logic; -- logic input
		s  	: out std_logic; -- logic output
		cout	: out std_logic -- logic output
	);
	end component;
	
	begin -- bit bit adder
		s1: somador_completo port map(a(0), b(0), c0, s(0), vai_um(0)); -- using the complete adder component to add bit by bit
		s2: somador_completo port map(a(1), b(1), vai_um(0), s(1), vai_um(1)); -- using the complete adder component to add bit by bit
		s3: somador_completo port map(a(2), b(2), vai_um(1), s(2), vai_um(2)); -- using the complete adder component to add bit by bit
		s4: somador_completo port map(a(3), b(3), vai_um(2), s(3), c4); -- using the complete adder component to add bit by bit
	end estrutural;