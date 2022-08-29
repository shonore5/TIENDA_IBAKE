library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Tienda_automatica is
	port(Clock,Resetn,Horario_laboral,deseo_comprar: in std_logic;
			galleta, jalea,re_frutilla,re_mora,re_chocolate,re_maracuya : in std_logic;
			frutilla,mora,chocolate,maracuya : in std_logic;
			led_frutilla, led_mora,led_chocolate,led_maracuya,listo_cheescake : out std_logic;
			encont_frutilla, encont_mora, encont_chocolate, encont_maracuya : out std_logic;
			encont_galleta,encont_relleno_frutilla,encont_relleno_mora,encont_relleno_chocolate,encont_relleno_maracuya,robot_stock,no_stock : out std_logic;
			encont_basegalleta1,encont_basegalleta2,encont_basegalleta3,encont_basegalleta4: out std_logic;
			--encont_jalea1,encont_jalea2,encont_jalea3,encont_jalea4 :out std_logic;
			error_nofrutilla,error_nomora,error_nochocolate,error_nomaracuya : out std_logic);
			
end Tienda_automatica;

architecture solucion of Tienda_automatica is
	type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Tp,
						Td2,Te2,Tf2,Tg2,Th2,Ti2,Tj2,Tk2,Tl2,Tm2,Tn2,
						Tk3,Tl3,Tm3,Tn3,Tk4,Tl4,Tm4,Tn4,
						Tl5,Tm5,Tn5);					
	signal y :estado;

	
	begin
		process(Clock,Resetn)
		begin
			if Resetn='0' then y<=Ta;
			elsif (Clock'event and Clock='1') then
				case y is
					when Ta => if(horario_laboral='1') then y<=Tb; else y<=Ta; end if;
					when Tb => if(deseo_comprar='1') then y<=Tc; else y<=Tb; end if;
					when Tc => if(deseo_comprar='0') then y<=Td; end if;
					when Td => if(galleta='1') then y<=Te; else y<= Td2; end if;
					when Td2=> y<=Td;
					when Te => if(jalea ='1') then y<= Tf; else y<=Te2; end if;
					when Te2=> y<=Td;
					when Tf => if(re_frutilla='1') then y<=Tg; else y<=Tf2; end if;
					when Tf2=> y<=Tg;
					when Tg => if(re_mora='1') then y<=Th; else y<=Tg2; end if;
					when Tg2=> y<=Th;
					when Th => if(re_chocolate='1') then y<=Ti; else y<=Th2; end if;
					when Th2=> y<=Ti;
					when Ti => if(re_maracuya='1') then y<=Tj; else y<=Ti2; end if;
					when Ti2=> y<=Td;
					when Tj => if(frutilla='1') then y<=Tk; else y<=Tl; end if;
					when Tk => if(frutilla='0') then y<=Tk2; else y<=Tk; end if;
					when Tk2=> y<=Tk3;
					when Tk3=> y<=Tk4;
					when Tl => if(mora='1') then y<=Tl2; else y<=Tm; end if;
					when Tl2 => if(mora='0') then y<=Tl3; else y<=Tl2; end if;
					when Tl3=> y<=Tl4;
					when Tl4=> y<=Tl5;
					when Tm => if(chocolate='1') then y<=Tm2; else y<=Tn; end if;
					when Tm2 => if(chocolate='0') then y<=Tm3; else y<=Tm2; end if;
					when Tm3=> y<=Tm4;
					when Tm4=> y<=Tm5;
					when Tn => if(maracuya='1') then y<=Tn2; else y<=Tn; end if;
					when Tn2 => if(maracuya='0') then y<=Tn3; else y<=Tnj; end if;
					when Tn3=> y<=Tkn4;
					when Tn4=> y<=Tn5;
					when Tk4=> y<=Tp;
					when Tl5=> y<=Tp;
					when Tm5=> y<=Tp;
					when Tn5=> y<=Tp;
					when Tp => y<=Tb;
				
				end case;
			end if;
		end process;
		process(y)
		Begin
				encont_frutilla<='0';encont_mora<='0';encont_chocolate<='0';encont_maracuya<='0';
				encont_relleno_frutilla<='0';encont_relleno_mora<='0';
				encont_relleno_chocolate<='0';encont_relleno_maracuya<='0';led_frutilla<='0';led_mora<='0';led_chocolate<='0';
				led_maracuya<='0';listo_cheescake<='0';robot_stock<='0',no_stock<='0';
				error_nofrutilla<='0';error_nomora<='0';error_nochocolate<='0';error_nomaracuya<='0';
				encont_jalea1<='0';encont_jalea2<='0';encont_jalea3<='0';encont_jalea4<='0';
				encont_basegalleta1<='0';encont_basegalleta2<='0';encont_basegalleta3<='0';encont_basegalleta4<='0';
			case y is
					when Ta => 
					when Tb => 
					when Tc => 
					when Td => robot_stock<='1';
					when Td2=> 
					when Te => encont_galleta<='0';
					when Te2=> 
					when Tf => led_frutilla<='1';
					when Tf2=> error_nofrutilla<='1';
					when Tg => led_frutilla<='1';
					when Tg2=> error_nomora<='1';
					when Th => led_mora<='1';
					when Th2=> error_nochocolate<='1';
					when Ti => led_chocolate<='1';
					when Ti2=> error_nomaracuya<='1';no_stock<='1';
					when Tj => led_maracuya<='1';
					when Tk => encont_frutilla<='1';
					when Tk2=> 
					when Tk3=> encont_basegalleta1<='1';
					when Tk4=> encont_relleno_frutilla<='1';
					when Tl => 
					when Tl2 => 
					when Tl3=> 
					when Tl4=> encont_basegalleta2<='1';
					when Tl5=> encont_relleno_mora<='1';
					when Tm => 
					when Tm2 => 
					when Tm3=> 
					when Tm4=> encont_basegalleta3<='1';
					when Tm5=> encont_relleno_chocolate<='1';
					when Tn => 
					when Tn2 => 
					when Tn3=> 
					when Tn4=> encont_basegalleta4<='1';
					when Tn5=> encont_relleno_maracuya<='1';
					when tp => listo_cheescake<='1';					
			end case;
		end process;
		
		
end solucion;
