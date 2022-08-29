library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity Restador2 is
	generic ( n: integer :=10);--<------- nbits
	port(
		A,B: in std_logic_vector(n-1 downto 0);
		S: out std_logic_vector(n downto 0));
end Restador2;

--Architecture
architecture solve of Restador2 is
	-- Signals,Constants,Variables,Components
	begin
		s<=('0'&A)-('0'&B);--Without the sign bit
		--s<='0'&(x+y);--with sign bit
end solve;