library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity Cnt_3bits is
	generic ( n: integer :=3);--<------- nbits
	port(
		Clk,resetn,en: in std_logic;
		q: buffer std_logic_vector(n-1 downto 0));
end Cnt_3bits;

--Architecture
architecture solve of Cnt_3bits is
	-- Signals,Constants,Variables,Components
	begin
	--Process #1
	process(resetn,clk)
	--Sequential programming
		begin
			if resetn='0' then
				q<=(others => '0');
			elsif clk'event and clk='1' then
				if en='1' then q<=q+1;
				end if;
			end if;
	end process;
	--Process #n...
end solve;