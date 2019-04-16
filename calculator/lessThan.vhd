library ieee ;
use ieee.std_logic_1164.all ;

-- declaring entity
entity lessThan is
port (
	A, B: in std_logic_vector(3 downto 0); -- vectors input
	AgtB : out STD_LOGIC  -- logic output
	);
end lessThan;

-- declaring architecture
architecture Behavior of lessThan is

-- include component bigger Then 
component biggerThen is
port (
	A, B: in std_logic_vector(3 downto 0);
	AgtB : out STD_LOGIC 
	);
end component ;


begin -- less Than
	menor: biggerThen port map(B, A ,AgtB); -- I made the smaller one from the larger one, inverting inputs
end Behavior ;