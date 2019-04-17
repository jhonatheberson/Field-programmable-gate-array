library ieee;
use ieee.std_logic_1164.all;

entity conversondisplay is -- entidade do conversor display
port(
  CTRL      : in std_logic_vector(1 downto 0); -- CTRL tem 2 bits
  Y      : in std_logic_vector(3 downto 0); -- Y tem 4 bits (resultado da operação)
  DISPLAY		: out std_logic_vector(6 downto 0)); -- Display tem 7 bits (Saída de 7 segmentos)
end conversondisplay;
 
architecture archConversor of conversondisplay is -- arquitetura do conversor

signal display2 : std_logic_vector(6 downto 0); -- sinal para auxiliar o resultado final
begin
	WITH Y SELECT -- nesse WITH SELECT usamos o sinal para "receber" e converter o Y para 7 segmentos 
  
    display2 <=  not("1111110") WHEN "0000", -- 0
                 not("0110000") WHEN "0001", -- 1
                 not("1101101") WHEN "0010", -- 2
                 not("1111001") WHEN "0011", -- 3
                 not("0110011") WHEN "0100", -- 4
                 not("1011011") WHEN "0101", -- 5
                 not("1011111") WHEN "0110", -- 6
                 not("1110000") WHEN "0111", -- 7
                 not("1111111") WHEN "1000", -- 8
                 not("1111011") WHEN "1001", -- 9
					  not("1110111") WHEN "1010", -- A
					  not("0011111") WHEN "1011", -- B
					  not("1001110") WHEN "1100", -- C
					  not("0111101") WHEN "1101", -- D
					  not("1001111") WHEN "1110", -- E
					  not("1000111") WHEN "1111", -- F
					  not("0000000") WHEN OTHERS;
					  
		WITH CTRL SELECT -- nesse segundo WITH SELECT trabalhamos com a variável controle e a nossa saída DISPLAY
			
			DISPLAY <= display2 		  WHEN "00", -- quando CTRL for 00, DISPLAY receberá display2
						  not("1001001") WHEN "01", -- quando CTRL for 01, DISPLAY receberá ERRO
						  not("0000000") WHEN "10", -- quando CTRL for 10, DISPLAY receberá DESLIGADO
						  not("0000000") WHEN OTHERS;
					  
end archConversor;
