----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2019 08:19:54 AM
-- Design Name: 
-- Module Name: tb_decodificador4_16 - Behavioral
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

entity tb_decodificador4_16 is
--  Port ( );
end tb_decodificador4_16;

architecture Behavioral of tb_decodificador4_16 is
    component decodificador4_16 is
        Port (X: in std_logic_vector(4 downto 0);
              Y: out std_logic_vector(15 downto 0)
        ); 
    end component;
    signal X: std_logic_vector(4 downto 0);
    signal Y: std_logic_vector(15 downto 0);
begin
    DUT: decodificador4_16 port map(X, Y);
    
    process begin
        X <= "1111";
        wait for 10ns;
        wait;
    end process;

end Behavioral;
