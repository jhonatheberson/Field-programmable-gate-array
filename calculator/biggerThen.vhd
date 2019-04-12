library ieee ;
use ieee.std_logic_1164.all ;


entity biggerThen is
port (
	A, B: in std_logic_vector(3 downto 0);
	AgtB : out STD_LOGIC 
	);
end biggerThen ;

architecture Behavior of biggerThen is
begin
AgtB <= (A(3) and not(B(3))) or ((A(3) xnor B(3)) and (A(2)and not B(2)))
 or ((A(3) xnor B(3)) and (A(2) xnor B(2)) and (A(1)and not B(1)))
 or ((A(3) xnor B(3)) and (A(2) xnor B(2)) and(A(1) xnor B(1)) and (A(0)and not B(0)));
end Behavior ;