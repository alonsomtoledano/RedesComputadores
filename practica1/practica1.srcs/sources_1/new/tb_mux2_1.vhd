----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2019 07:41:22 AM
-- Design Name: 
-- Module Name: tb_mux2_1 - Behavioral
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

entity tb_mux2_1 is
--  Port ( );
end tb_mux2_1;

architecture Behavioral of tb_mux2_1 is
    component mux2_1 is
        Port (X: in std_logic_vector(1 downto 0);
              SEL: in std_logic;
              Y: out std_logic
        );
    end component;
    signal X: std_logic_vector(1 downto 0);
    signal SEL, Y: std_logic;
begin
    DUT: mux2_1 port map(X, SEL, Y);
    
    process begin
        X <= "10";
        SEL <= '0';
        wait for 10ns;
    end process;

end Behavioral;
