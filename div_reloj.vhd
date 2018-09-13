------------------------------------------------------
-- EJEMPLO 2: DIVISIÓN DE LA FRECUENCIA DEL RELOJ
--
-- Departamento de Ingeniería Electrónica (2013)
------------------------------------------------------ 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity circuito is
    Port ( CLK : in  STD_LOGIC;    -- Reloj de entrada a la FPGA
           SAL : out  STD_LOGIC);  -- salida del circuito para conectar al LED
end circuito;

architecture a_circuito of circuito is
signal contador : STD_LOGIC_VECTOR (31 downto 0);
signal flag : STD_LOGIC;
begin
  PROC_CONT : process (CLK)
    begin
    if CLK'event and CLK='1' then
      contador<=contador + '1';
      if contador=25000000 then   -- el reloj tiene un periodo de 20 ns (50 MHz)
        flag<=not flag;           -- tras 25e6 cuentas habrán transcurrido 500 ms                    
	     contador<=(others=>'0');
      end if;	 
    end if;	
    end process;
  SAL<=flag;
end a_circuito;
