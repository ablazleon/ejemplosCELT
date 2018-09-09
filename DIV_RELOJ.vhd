----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:50:49 09/09/2018 
-- Design Name: 
-- Module Name:    DIV_RELOJ - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DIV_RELOJ is
    Port ( CLK : in  STD_LOGIC;   -- Reloj a la entrada de la FPGA
           SAL : out  STD_LOGIC); --  salida del circuito para conectar al LED
end DIV_RELOJ;

architecture Behavioral of DIV_RELOJ is
signal contador : STD_LOGIC_VECTOR (31 downto 0);
signal flag : STD_LOGIC;
begin
	PROC_CONT : process (CLK)
		begin
		if CLK'event and CLK='1' then
			contador<=contador + '1';
			if contador=250000000 then -- el reloj tiene un periodo de 20 ns (50 MHz)
												-- se quiere que el LED parapadee con T=500ms
				flag<=not flag 			-- tras 25e6 cuentes => un periodo
				contador<=(others=>'0');
			end if;
		end if;
		end process;
			
	SAL<=flag;
end Behavioral;

