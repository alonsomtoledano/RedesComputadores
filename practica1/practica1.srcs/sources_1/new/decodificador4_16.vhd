----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2019 07:58:59 AM
-- Design Name: 
-- Module Name: decodificador4_16 - Dataflow
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

entity decodificador4_16 is
    Port (X: in std_logic_vector(4 downto 0);
          Y: out std_logic_vector(15 downto 0)
    );  
end decodificador4_16;

architecture Behavioral of decodificador4_16 is

begin
    process begin
        case X is
            when "0000" => 
                Y(0) <= X(0); 
            when "0001" => 
                Y(1) <= X(1);
            when "0010" => 
                Y(2) <= X(2);
            when "0011" => 
                Y(3) <= X(3);
            when "0100" => 
                Y(4) <= X(4);
            when "0101" => 
                Y(5) <= X(5);
            when "0110" => 
                Y(6) <= X(6);
            when "0111" => 
                Y(7) <= X(7);
            when "1000" => 
                Y(8) <= X(8);
            when "1001" => 
                Y(9) <= X(9);
            when "1010" => 
                Y(10) <= X(10);
            when "1011" => 
                Y(11) <= X(11);
            when "1100" => 
                Y(12) <= X(12);
            when "1101" => 
                Y(13) <= X(13);
            when "1110" => 
                Y(14) <= X(14);
            when "1111" => 
                Y(15) <= X(15);
            when others => 
                Y <= "0000000000000000";
        end case X;
    end process;       

end Behavioral;
