library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;

entity giggerThen is
port (
	A, B: in SIGNED(3 downto 0);
	AgtB : OUT STD_LOGIC 
	);
END giggerThen ;

ARCHITECTURE Behavior OF lessThan IS
BEGIN
AgtB <= '1' WHEN A > B ELSE '0' ;
END Behavior ;