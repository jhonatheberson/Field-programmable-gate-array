library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;

entity lessThan is
port (
	A, B: in SIGNED(3 downto 0);
	AltB : OUT STD_LOGIC 
	);
END lessThan ;

ARCHITECTURE Behavior OF lessThan IS
BEGIN
AltB <= '1' WHEN A < B ELSE '0';
END Behavior ;