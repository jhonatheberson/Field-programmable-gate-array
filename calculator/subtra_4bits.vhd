library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

-- declaring entity
entity subtra_4bits is 
port(
	a,b: in std_logic_vector(3 downto 0); -- vectors input the 4 bits
	s  : out std_logic_vector(3 downto 0); -- vectors output the 4 bits or result subtracion
	c4 : out std_logic -- logic output or error
	);
end subtra_4bits;

-- declaring architecture
architecture estrutural of subtra_4bits is
	signal t, result, resultSub, aux:std_logic_vector(3 downto 0);
	signal queue, agtb : std_logic;
	
	-- include component lessThan
	component lessThan is
	port (
		A, B: in std_logic_vector(3 downto 0); -- vectors input the 4 bits
		AgtB : out STD_LOGIC --logic output
		);
	end component;
	
	-- include component inverter
	component inverter is
	port (
		A: in std_logic_vector(3 downto 0); -- vectors input the 4 bits
		S: out std_logic_vector(3 downto 0) -- vectors output the 4 bits
			);
	end component;
	
	-- include component somador_4bits
	component somador_4bits is 
	port(
		a,b: in std_logic_vector(3 downto 0); -- vectors input the 4 bits
		c0 : in std_logic; --logic input
		s  : out std_logic_vector(3 downto 0); -- vectors output the 4 bits
		c4 : out std_logic --logic output
		);
	end component;
	
	begin -- técnica do eleva dois
		inv_b0: inverter port map(b, t); -- inveter o numero a ser subtraido
		sub: somador_4bits port map(a,t, queue, result); -- soma com o numero maior que o que invertir
		sub2: somador_4bits port map(result, "0001", queue, resultSub); -- soma com 1 o resulta da soma anterior
		trat: lessThan port map(a,b, agtb); -- fazendo tratamento para ver se b >a
		aux(0) <= agtb; -- fazendo 4 bits para ser o erro
		aux(1) <= agtb;
		aux(2) <= agtb;
		aux(3) <= agtb;
		s <= (resultSub and not(aux)); -- se aux for 1, logo da erro, não é possivel fazer a subtração
		c4 <= agtb;
	end estrutural;