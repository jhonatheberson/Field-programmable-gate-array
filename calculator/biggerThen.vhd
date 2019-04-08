library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_arith.all ;

entity biggerThen is
port (
	A, B: in SIGNED(3 downto 0);
	AgtB : out STD_LOGIC 
	);
end biggerThen ;

architecture Behavior of biggerThen is
begin
AgtB <= '1' when A > B else '0' ;
end Behavior ;