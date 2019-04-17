--libraries to be used are specified here
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
--entity declaration with port definitions
entity somador_4bits is
port(
	a, b : in std_logic_vector(3 downto 0);  --4 bit input 1
	s  : out std_logic_vector(3 downto 0);   -- 4 bit s
	c4:  out std_logic   -- c4 out.
);
end somador_4bits;
 
--architecture of entity
architecture Behavioral of somador_4bits is
  --temporary signal declarations(for intermediate c4's).
  signal c0,c1,c2,c3 : std_logic := '0';
begin  
 
  --first full adder
  s(0) <= a(0) xor b(0);  --s calculation
  c0 <= a(0) and b(0);          --c4 calculation
   
  --second full adder
  s(1) <= a(1) xor b(1) xor c0;
  c1 <= (a(1) and b(1)) or (a(1) and c0) or (b(1) and c0);
 
  --third full adder
  s(2) <= a(2) xor b(2) xor c1;
  c2 <= (a(2) and b(2)) or (a(2) and c1) or (b(2) and c1);
 
  --fourth(final) full adder
  s(3) <= a(3) xor b(3) xor c2;
  c3 <= (a(3) and b(3)) or (a(3) and c2) or (b(3) and c2);
 
  --final c4 assignment
  c4 <= c3;
 
end Behavioral;