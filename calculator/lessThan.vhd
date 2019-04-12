library ieee ;
use ieee.std_logic_1164.all ;


entity lessThan is
port (
	A, B: in std_logic_vector(3 downto 0);
	AgtB : out STD_LOGIC 
	);
end lessThan;

architecture Behavior of lessThan is

component biggerThen is
port (
	A, B: in std_logic_vector(3 downto 0);
	AgtB : out STD_LOGIC 
	);
end component ;


begin
	menor: biggerThen port map(B, A ,AgtB);
end Behavior ;