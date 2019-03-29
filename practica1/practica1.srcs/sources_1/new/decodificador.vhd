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
          m: out std_logic_vector(4 downto 0);
          error: out std_logic_vector(3 downto 0)
    );
end decodificador;

architecture Structural of decodificador is
    signal p_new: std_logic_vector(3 downto 0); -- Encontrar posición error
    signal p_old: std_logic_vector(3 downto 0);
begin
    p_old <= r(8) & r(7) & r(5) & r(1);
    p_new(0) <= r(6) xor r(4) xor r(2) xor r(0) xor r(8);
    p_new(1) <= r(6) xor r(3) xor r(2) xor r(7);
    p_new(2) <= r(4) xor r(3) xor r(2) xor r(5);
    p_new(3) <= r(0) xor r(1);
    
    error <= p_new;
    
    process(r, p_new) begin
        case p_new is
            when "0011" => 
               m <= not r(6) & r(4) & r(3) & not r(2) & r(0);
            when "0101" => 
                m <= r(6) & not r(4) & r(3) & r(2) & r(0);
            when "0110" => 
                 m <= r(6) & r(4) & not r(3) & r(2) & r(0);
            when "0111" =>
                 m <= r(6) & r(4) & r(3) & not r(2) & r(0);
            when "1001" => 
                 m <= r(6) & r(4) & r(3) & r(2) & not r(0);
            when others => 
                m <= r(6) & r(4) & r(3) & r(2) & r(0);
        end case X;
    end process;   
    
end Structural;
