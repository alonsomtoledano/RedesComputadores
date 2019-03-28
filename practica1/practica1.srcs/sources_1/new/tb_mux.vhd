----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/27/2019 07:47:39 PM
-- Design Name: 
-- Module Name: tb_mux - Behavioral
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

entity tb_mux is
--  Port ( );
end tb_mux;

architecture Behavioral of tb_mux is
    component mux is
        Port (SEL: in std_logic_vector(3 downto 0);
          m: in std_logic_vector(4 downto 0);
          Y: out std_logic_vector(4 downto 0) 
        );
    end component;
    signal SEL: std_logic_vector(3 downto 0);
    signal m: std_logic_vector(4 downto 0);
    signal Y: std_logic_vector(4 downto 0);
begin
    DUT: mux port map(SEL, m, Y);
    process begin
        SEL <= "1001";
        m <= "10011";
        wait for 10ns;
    end process;

end Behavioral;
