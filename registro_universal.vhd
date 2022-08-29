library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity registro_universal is
	Port ( D: in STD_LOGIC_VECTOR(3 downto 0);
		S : in STD_LOGIC_VECTOR(1 downto 0);
		CLK, R, L, RESET, enable: in STD_LOGIC;
		Q: out STD_LOGIC_VECTOR(3 downto 0));
end registro_universal;

Architecture sol of registro_universal is
SIGNAL Q1: STD_LOGIC_VECTOR(3 downto 0);
Begin
	Q <= Q1;
	
	process (CLK, RESET)
	begin
		if reset ='0' then Q1 <= "0000";
		elsif (clk'event and clk='1' and enable='1') then
		case S is
			when "00"=>  Q1<=Q1;
			when "01"=>  Q1<=R & Q1 (3 downto 1);
			when "10"=>  Q1<=Q1 (2 downto 0) & L;
			when "11"=>  Q1<=D (3 downto 0);
			when others => Q1<=Q1;
		end case;
		end if;
	end process;	
end sol;