library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ASM_codigo is
	port(Clock,Resetn,Horario_laboral,deseo_comprar: in std_logic;
			galleta, jalea,re_frutilla,re_mora,re_chocolate,re_maracuya : in std_logic;
			frutilla,mora,chocolate,maracuya,tiempo_18pm : in std_logic;
			trituracion_finalizada,poner_base_finalizado,poner_relleno_finalizado,poner_jalea_finalizado,listo_cheescake  : in std_logic;
			actualizar_ventas,en_contador_dias,error_galleta,error_jalea : out std_logic;
			error_base,error_nofrutilla,error_nomora,error_nochocolate,error_nomaracuya : out std_logic;
			S1,S0,comenzar_trituracion,comenzar_base,comenzar_relleno,comenzar_jalea : out std_logic;
			actualizar_reg_seleccion,en_sel : out std_logic);
			
			
			
end ASM_codigo;

architecture solucion of ASM_codigo is
	type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Tp);				
	signal y :estado;

	
	begin
		process(Clock,Resetn)
		begin
			if Resetn='0' then y<=Ta;
			elsif (Clock'event and Clock='1') then
				case y is
						when Ta => if(horario_laboral='1') then y<=Tb; else y<=Ta; end if;
						when Tb => if(deseo_comprar='1') then y<=Tc; else y<=Tb; end if;
						when Tc => if(deseo_comprar='0') then y<=Td; else y<=Tc; end if;
						when Td => if (galleta='1') and (jalea='1') and ((re_frutilla='1') or (re_mora='1') or (re_chocolate='1') or (re_maracuya='1')) then y<=Te; else y<= Td; end if;
						when Te => if (frutilla='1') or (mora='1') or (chocolate='1') or (maracuya='1') then y<=Tf; else y<=Te; end if;
						when Tf => y<=Tg;
						when Tg => if(trituracion_finalizada='1') then y<=Th; else y<=Tg; end if;
						when Th => y<=Ti;
						when Ti => if(poner_base_finalizado='1') then y<=Tj; else y<=Ti; end if;
						when Tj => y<=Tk;
						when Tk => if(poner_relleno_finalizado='1') then y<=Tl; else y<=Tk; end if;
						when Tl => y<=Tm;
						when Tm => if(poner_jalea_finalizado='1') then y<=Tn; else y<=Tm; end if;
						when Tn => if(listo_cheescake='1') then y<=Tp; else y<=Tn; end if;
						when Tp => y<=Tb;

				
				end case;
			end if;
		end process;
		process(y)
		Begin
				actualizar_ventas<='0';en_contador_dias<='0';error_galleta<='0';error_jalea<='0';
				error_base<='0';error_nofrutilla<='0';error_nomora<='0';error_nochocolate<='0';error_nomaracuya<='0';
				S1<='0';S0<='0';comenzar_trituracion<='0';comenzar_base<='0';comenzar_relleno<='0';comenzar_jalea<='0';
				actualizar_reg_seleccion<='0';en_sel<='0';
				
			case y is
					when Ta => if(tiempo_18pm='1') then actualizar_ventas<='1'; en_contador_dias<='1'; end if;
					when Tb => 
					when Tc => 
					when Td => 	if (galleta='0') then error_galleta<='1'; end if;
									if (jalea='0') then error_jalea<='1'; end if;
									if (re_frutilla='0') then error_nofrutilla<='1'; end if;
									if (re_mora='0') then error_nomora<='1'; end if;
									if (re_chocolate='0') then error_nochocolate<='1'; end if;
									if (re_maracuya='0') then error_nomaracuya<='1'; end if;
					
					when Te => 	actualizar_reg_seleccion<= '1';
									en_sel<='1';
									if (frutilla='1') then 		S1<='0';
																		S0<='0';
									elsif (mora='1') then		S1<='0';
																		S0<='1';
									elsif (chocolate='1') then	S1<='1';
																		S0<='0';
									elsif (maracuya='1') then 	S1<='1';
																		S0<='1';
																		
									end if;
					
					when Tf => comenzar_trituracion<='1';
					when Tg =>
					when Th => comenzar_base<='1';
					when Ti => 
					when Tj => comenzar_relleno<='1';
					when Tk =>
					when Tl => comenzar_jalea<='1';
					when Tm =>
					when Tn =>
					when Tp =>
						
					
					
					
			
			end case;
		end process;
		
		
end solucion;
