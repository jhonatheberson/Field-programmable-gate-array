library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity somador_4bits is 
port(
	a,b: in std_logic_vector(3 downto 0);
	c0 : in std_logic;
	s  : out std_logic_vector(3 downto 0);
	c4 : out std_logic
	);
end somador_4bits;

architecture estrutural of somador_4bits is
	signal vai_um : std_logic_vector(0 to 2);
	
	component somador_completo is
	port(
		a,b	: in std_logic;
		cin	: in std_logic;
		s  	: out std_logic;
		cout	: out std_logic
	);
	end component;
	
	begin
		s1: somador_completo port map(a(0), b(0), c0, s(0), vai_um(0));
		s2: somador_completo port map(a(1), b(1), vai_um(0), s(1), vai_um(1));
		s3: somador_completo port map(a(2), b(2), vai_um(1), s(2), vai_um(2));
		s4: somador_completo port map(a(3), b(3), vai_um(2), s(3), c4);
	end estrutural;