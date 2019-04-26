library ieee;
use ieee.std_logic_1164.all;

entity latchRS is 
port(
	R, S, enable: in std_logic;
	Q, Qbar: out std_logic
);
end latchRS;

architecture archLatchRS of latchRS is
	signal QS, QR : std_logic;
begin

	QS <= (S and enable) nand QR;
	QR <= (R and enable) nand QS;
	Q <= QS;
	Qbar <= QR;
	
end archLatchRS;
