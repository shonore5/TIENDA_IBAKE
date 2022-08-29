library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

--Entity
entity RAM1 is 
	generic(n: integer:=6;-- n-bits per data
	m: integer:=3); -- m-bits of addresses
	port(
		wr: in std_logic; 
		addr : in std_logic_vector(m-1 downto 0); 
		Din : in std_logic_vector(n-1 downto 0);
		Dout : out std_logic_vector(n-1 downto 0)); 
end RAM1;

--Architecture
architecture solve of RAM1 is
	-- Signals,Constants,Variables,Components	
	type ram_type is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0); 
	signal tmp_ram: ram_type; 
	begin
	--Process #1:
	process(wr)
	--Sequential programming
		begin 
				if wr='1' then --write
					tmp_ram(conv_integer(addr)) <= Din; 
				end if;  
	end process; 
	Dout <= tmp_ram(conv_integer(addr));--read
	--Process #n...
end solve;