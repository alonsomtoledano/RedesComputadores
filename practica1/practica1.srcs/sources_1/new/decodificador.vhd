----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2019 03:15:11 PM
-- Design Name: 
-- Module Name: codificador - Dataflow
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decodificador is
    -- Hamming(9,5)
    Port (r: in std_logic_vector(8 downto 0);
          m: out std_logic_vector(4 downto 0)
    );
end decodificador;

architecture Structural of decodificador is

    component mux2_1 is
        Port (X: in std_logic_vector(1 downto 0);
              SEL: in std_logic;
              Y: out std_logic
        );
    end component;
    
    component decodificador4_16 is
        Port (X: in std_logic_vector(4 downto 0);
              Y: out std_logic_vector(15 downto 0)
        );  
    end component;
    
    signal p_new: std_logic_vector(3 downto 0); -- Encontrar posición error
    signal p_old: std_logic_vector(3 downto 0);
begin
    p_old <= r(8) & r(7) & r(5) & r(1);
    p_new(0) <= r(6) xor r(4) xor r(2) xor r(0) xor r(8);
    p_new(1) <= r(6) xor r(3) xor r(2) xor r(7);
    p_new(2) <= r(4) xor r(3) xor r(2) xor r(5);
    p_new(3) <= r(0) xor r(1);
    
    m(4) <= r(6);
    m(3) <= r(4);
    m(2) <= r(3);
    m(1) <= r(2);
    m(0) <= r(0);
    
    -- Instancias aquí: se utiliza el deco y las puertas para cada entrada para
    -- corregir el error y sacar la salida de 5 BITS.
    
end Structural;
