----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/01/2019 04:35:59 PM
-- Design Name: 
-- Module Name: tb_transmision - Behavioral
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

entity tb_transmision is
--  Port ( );
end tb_transmision;

architecture Behavioral of tb_transmision is
    component transmision is
        Port (CLK, RST, X: in std_logic;
		      Y, Z: out std_logic
        );
    end component;
    
    signal CLK, RST, X, Y, Z: std_logic;
begin
    DUT: transmision port map(CLK, RST, X, Y, Z);
    
    process begin
        CLK <= '1'; wait for 10ns;
        CLK <= '0'; wait for 10ns;
    end process;
    
    process begin 
        RST <= '1'; wait for 10ns;
        RST <= '0'; wait;
    end process;
    
    process begin
        -- Ejemplo
        X <= '0'; wait for 20ns;
        X <= '1'; wait for 20ns;
        X <= '0'; wait for 20ns;
        X <= '0'; wait for 20ns;
        X <= '1'; wait for 20ns;
        X <= '0'; wait for 20ns;
        X <= '1'; wait for 20ns;
        X <= '0'; wait for 20ns;
        X <= '0'; wait for 20ns;
        X <= '0'; wait for 20ns;
        X <= '0'; wait for 20ns;
        X <= '0'; wait for 20ns;
        X <= '1'; wait for 20ns;
        wait;
    end process;

end Behavioral;
