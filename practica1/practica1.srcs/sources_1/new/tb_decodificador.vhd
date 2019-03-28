----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2019 06:32:16 PM
-- Design Name: 
-- Module Name: tb_decodificador - Behavioral
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

entity tb_decodificador is
--  Port ( );
end tb_decodificador;

architecture Behavioral of tb_decodificador is
    component decodificador is
        Port (r: in std_logic_vector(8 downto 0);
          m: out std_logic_vector(4 downto 0);
          error: out std_logic_vector(3 downto 0)
        );
    end component;
    
    signal m: std_logic_vector(4 downto 0);
    signal r: std_logic_vector(8 downto 0);
    signal error: std_logic_vector(3 downto 0);
begin
    DUT: decodificador port map(r, m, error);
    process begin
        r <= "000100100";
        wait for 10ns;
    end process;
end Behavioral;
