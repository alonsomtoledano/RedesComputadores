----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/26/2019 08:00:49 PM
-- Design Name: 
-- Module Name: tb_codificador - Behavioral
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

entity tb_codificador is
--  Port ( );
end tb_codificador;

architecture Behavioral of tb_codificador is
    component codificador is
        Port (m: in std_logic_vector(4 downto 0);
              r: out std_logic_vector(8 downto 0)
        );
    end component;
    
    signal m: std_logic_vector(4 downto 0);
    signal r: std_logic_vector(8 downto 0);
begin
    DUT: codificador port map(m, r);
    
    process begin
        m <= "10010";
        wait for 10ns;
    end process;

end Behavioral;
