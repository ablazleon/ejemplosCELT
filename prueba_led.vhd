------------------------------------------------------
-- EJEMPLO 1: ENCENDIDO DE UN LED
--
-- Departamento de Ingeniería Electrónica (2013)
------------------------------------------------------ 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity circuito is
  port (
    CONMUT0 : in   STD_LOGIC;    -- Conmutador conectado a una entrada
	 CONMUT1 : in   STD_LOGIC;    -- Conmutador conectado a una entrada 
	 CONMUT2 : in   STD_LOGIC;    -- Conmutador conectado a una entrada
	 
	 
	 LED    : out   STD_LOGIC    -- LED conectado a una salida
	 );  
end circuito;

architecture a_circuito of circuito is

SIGNAL suma: Std_logic; --Hacemos un vector grande

begin

-- suma <= CONMUT0 + CONMUT1 + CONMUT2;
suma <= CONMUT0 xor CONMUT1 xor CONMUT2;

LED<=suma;
end a_circuito;
