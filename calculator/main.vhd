library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;



entity main is
	port (a,b: in std_logic_vector(3 downto 0);   --bits pra operar
			ld : in std_logic;                       --liga desliga
			key: in std_logic_vector(2 downto 0);    --chave pra mudar operação
			dsp: out std_logic_vector(6 downto 0);  --saidas do display
			cout: out std_logic);                    -- saida do led (cout) 
end main;

architecture projeto of main is --Bloco do projeto

	--CÓDIGOS DA CHAVE :
	--000 : somador
	--001: subtrador
	--010: maior
	--100: menor
	--111: inversor

	component mux is 
	-- Multiplexador que recebe como entrada a operacao, a chave de operacao (s) e o bit lig/desl (ld)
	-- As saídas do multiplexador sao o resultado da operacao, o controle do display e o cout para o LED
		port(soma, subtracao, invertido : in std_logic_vector(3 downto 0);
			carrySoma, carrySub, maiorque, menorque, ld : in std_logic;
			key: in std_logic_vector(2 downto 0);
			resultadoDisplay: out std_logic_vector(3 downto 0);
			ctrl: out std_logic_vector(1 downto 0);			
			cout: out std_logic);
	end component;

	component somador_4bits is 
port(
	a,b: in std_logic_vector(3 downto 0); -- vectors input the 4 bits
	s  : out std_logic_vector(3 downto 0); -- vectors input the 4 bits, which is the sum
	c4 : out std_logic -- logic output, elevates one to make adder with more bits
	);
end component;

	component subtra_4bits is 
port(
	a,b: in std_logic_vector(3 downto 0); -- vectors input the 4 bits
	s  : out std_logic_vector(3 downto 0); -- vectors output the 4 bits or result subtracion
	c4 : out std_logic -- logic output or error
	);
end component;

	component biggerThen is
port (
	A, B: in std_logic_vector(3 downto 0); -- vectors input 
	AgtB : out STD_LOGIC -- logic output
	);
end component ;

	component lessThan is
port (
	A, B: in std_logic_vector(3 downto 0); -- vectors input
	AgtB : out STD_LOGIC  -- logic output
	);
end component;

	component inverter is 
port (
	A: in std_logic_vector(3 downto 0); -- vector input
	S: out std_logic_vector(3 downto 0) -- vector output
	);
end component;

component conversondisplay is
port(
  CTRL      : in std_logic_vector(1 downto 0);
  Y      : in std_logic_vector(3 downto 0);
  DISPLAY		: out std_logic_vector(6 downto 0));
end component;
	
	signal resultadoSoma, resultadoSub, resultadoInvert, resultadoDisp :std_logic_vector(3 downto 0); --auxiliar para resultado
	signal coutSoma, coutSub, coutMaior, coutMenor: std_logic;
	signal controle: std_logic_vector(1 downto 0);
	
	begin
		som: somador_4bits port map(a, b,resultadoSoma, coutSoma);
		sub: subtra_4bits port map(a, b, resultadoSub,coutSub);
		mais: biggerThen port map(a,b,coutMaior);
		menos: lessThan port map(a,b, coutMenor);
		inverte: inverter port map(a, resultadoInvert);
		multiplexador: mux port map(resultadoSoma, resultadoSub, resultadoInvert,coutSoma,coutSub,coutMaior,coutMenor,ld, key, resultadoDisp, controle,cout);
		mostrar: conversondisplay port map(controle, resultadoDisp,dsp);
		
	end projeto;
		