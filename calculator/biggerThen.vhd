library ieee ;
use ieee.std_logic_1164.all ;

-- declaring entity
entity biggerThen is
port (
	A, B: in std_logic_vector(3 downto 0); -- vectors input 
	AgtB : out STD_LOGIC -- logic output
	);
end biggerThen ;

-- declaring architecture
architecture Behavior of biggerThen is -- biggerThen
begin
AgtB <= (A(3) and not(B(3))) or ((A(3) xnor B(3)) and (A(2)and not B(2)))
 or ((A(3) xnor B(3)) and (A(2) xnor B(2)) and (A(1)and not B(1)))
 or ((A(3) xnor B(3)) and (A(2) xnor B(2)) and(A(1) xnor B(1)) and (A(0)and not B(0)));
end Behavior ;