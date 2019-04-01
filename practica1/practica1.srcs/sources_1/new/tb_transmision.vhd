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
		      Y: buffer std_logic
        );
    end component;
    
    signal CLK, RST, X, Y: std_logic;
begin
    DUT: transmision port map(CLK, RST, X, Y);
    
    process begin
        RST <= '1'; RST <= '0';
        X <= '0'; wait for 10ns;
        X <= '1'; wait for 10ns;
        X <= '0'; wait for 10ns;
        X <= '1'; wait for 10ns;
        X <= '0'; wait for 10ns;
        X <= '1'; wait for 10ns;
        X <= '1'; wait for 10ns;
    end process;

end Behavioral;
