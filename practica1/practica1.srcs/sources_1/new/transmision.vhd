----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2019 08:11:21 PM
-- Design Name: 
-- Module Name: transmision - Behavioral
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

entity transmision is
    Port (CLK, RST, X: in std_logic;
		  Y, Z: out std_logic
    );
end transmision;

architecture Behavioral of transmision is
	type state_type is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10);
	signal current_state, next_state: state_type;
begin
	-- Proceso secuencial
	process(CLK) begin
		if(rising_edge(CLK)) then
			if(RST = '1') then
				current_state <= S0;
			else
			    current_state <= next_state;
			end if;
		end if;
	end process;
    
	-- Proceso combinacional para controlar los cambios de
	-- estado y la salida
	process(current_state, X) begin
		case current_state is
			when S0 => 
			    Y <= X;
			    Z <= '1';
				if(X = '1') then
					next_state <= S0;
				else
					next_state <= S1;
				end if;
			when S1 =>
			    Y <= X;
			    Z <= '1';
				if(X = '1') then
					next_state <= S2;
				else
					next_state <= S1;
				end if;
			when S2 => 
			    Y <= X;
			    Z <= '1';
				if(X = '1') then
					next_state <= S0;
				else
					next_state <= S3;
				end if;
			when S3 =>
			    Y <= X;
			    Z <= '1';
				if(X = '1') then
					next_state <= S4;
				else
					next_state <= S8;
				end if;
			when S4 =>
			    Y <= X; 
			    Z <= '1';
				if(X = '1') then
					next_state <= S0;
				else
					next_state <= S5;
				end if;
			when S5 =>
			    Y <= X; 
			    Z <= '1';
				if(X = '1') then
					next_state <= S6;
				else
					next_state <= S8;
				end if;
			when S6 =>
			    Y <= X; 
			    Z <= '1';
				if(X = '1') then
					next_state <= S7;
				else
					next_state <= S3;
				end if;
			when S7 =>
				Y <= X;
				Z <= '0';
				if(X = '1') then
					next_state <= S1;
				else
					next_state <= S1;
				end if;
				Y <= X;
			when S8 =>
			    Y <= X;
			    Z <= '1'; 
				if(X = '1') then
					next_state <= S0;
				else
					next_state <= S9;
				end if;
			when S9 =>
			    Y <= X;
			    Z <= '1'; 
				if(X = '1') then
					next_state <= S0;
				else
					next_state <= S10;
				end if;
			when S10 =>
			    Y <= X; 
			    Z <= '1';
				if(X = '1') then
					next_state <= S0;
				else
					next_state <= S7;
				end if;
		end case;
	end process;
		
end Behavioral;
