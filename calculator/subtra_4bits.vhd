library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

entity subtra_4bits is 
port(
	a,b: in std_logic_vector(3 downto 0);
	c0 : in std_logic;
	s  : out std_logic_vector(3 downto 0);
	c4 : out std_logic
	);
end subtra_4bits;

architecture estrutural of subtra_4bits is
	signal vai_um : std_logic_vector(0 to 2);
	signal t, result, resultSub, aux:std_logic_vector(3 downto 0);
	signal queue, cout4, agtb : std_logic;
	
	component lessThan is
	port (
		A, B: in std_logic_vector(3 downto 0);
		AgtB : out STD_LOGIC 
		);
	end component;
	
	component inverter is
	port (
		A: in std_logic_vector(3 downto 0);
		S: out std_logic_vector(3 downto 0)
			);
	end component;
	
	component somador_4bits is 
	port(
		a,b: in std_logic_vector(3 downto 0);
		c0 : in std_logic;
		s  : out std_logic_vector(3 downto 0);
		c4 : out std_logic
		);
	end component;
	
	begin
		inv_b0: inverter port map(b, t);
		sub: somador_4bits port map(a,t, queue, result);
		sub2: somador_4bits port map(result, "0001", queue, resultSub);
		trat: lessThan port map(a,b, agtb);
		aux(0) <= agtb;
		aux(1) <= agtb;
		aux(2) <= agtb;
		aux(3) <= agtb;
		s <= (resultSub and not(aux));
		c4 <= agtb;
	end estrutural;