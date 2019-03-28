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

entity codificador is
    -- Hamming(9,5)
    Port (m: in std_logic_vector(4 downto 0);
          r: out std_logic_vector(8 downto 0)
    );
end codificador;

architecture Dataflow of codificador is
    
begin
    r(0) <= m(0);
    r(1) <= m(0);
    r(2) <= m(1);
    r(3) <= m(2);
    r(4) <= m(3);
    r(5) <= m(3) xor m(2) xor m(1);
    r(6) <= m(4);
    r(7) <= m(4) xor m(2) xor m(1);
    r(8) <= m(4) xor m(3) xor m(1) xor m(0);
end Dataflow;
