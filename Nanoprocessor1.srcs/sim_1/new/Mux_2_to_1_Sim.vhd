----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2023 09:52:25 PM
-- Design Name: 
-- Module Name: Mux_2_to_1_Sim - Behavioral
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

entity Mux_2_to_1_Sim is
--  Port ( );
end Mux_2_to_1_Sim;

architecture Behavioral of Mux_2_to_1_Sim is
COMPONENT Mux_2_to_1
    PORT(
        S : in STD_LOGIC;
        EN : in STD_LOGIC;
        D : in STD_LOGIC_VECTOR;
        Y : out STD_LOGIC);
 END COMPONENT;
 
 signal S : STD_LOGIC;
 signal D : STD_LOGIC_VECTOR(1 downto 0);
 SIGNAL EN : STD_LOGIC;
 signal Y : STD_LOGIC;

begin
UUT : Mux_2_to_1 PORT MAP(
    S => S,
    D => D,
    EN => EN,
    Y => Y);

process begin
    D(0) <= '1';
    D(1) <= '0';
    
    EN <= '0';
    S <= '1';
    wait for 100 ns;
    
    EN <= '1';
    wait for 100 ns;
    
    S <= '0';
    wait for 100 ns;
    
    D(0) <= '0';
    D(1) <= '1';
    
    S <= '0';
    wait for 100 ns;
    
    S <= '1';
    wait;
    
end process;

end Behavioral;
