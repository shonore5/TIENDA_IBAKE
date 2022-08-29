library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity DecoDecimal_BCD is 
      port(decimal: in std_logic_vector (5 downto 0);
		         bcd: out std_logic_vector (3 downto 0));
end DecoDecimal_BCD;

--Architecture
architecture Respuesta of DecoDecimal_BCD is
-- Signals,Constants,Variables,Components

BEGIN
	process(decimal)
	begin
		case decimal is
			when "000000"=>	bcd<= "0000";	-- 0
			when "000001"=>	bcd<= "0001";	-- 1
			when "000010"=>	bcd<= "0010";	-- 2
			when "000011"=>	bcd<= "0011";	-- 3
			when "000100"=>	bcd<= "0100";	-- 4
			when "000101"=>	bcd<= "0101";	-- 5
			when "000110"=>	bcd<= "0110";	-- 6
			when "000111"=>	bcd<= "0111";	-- 7
			when "001000"=>	bcd<= "1000";	-- 8
			when "001001"=>	bcd<= "1001";	-- 9
			when others =>	bcd<= "1111";	-- Null
		end case;
	end process;
end Respuesta;