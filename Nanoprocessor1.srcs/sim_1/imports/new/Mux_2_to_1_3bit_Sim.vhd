----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2023 11:10:30 PM
-- Design Name: 
-- Module Name: Mux_2_to_1_3bit_Sim - Behavioral
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

entity Mux_2_to_1_3bit_Sim is
--  Port ( );
end Mux_2_to_1_3bit_Sim;

architecture Behavioral of Mux_2_to_1_3bit_Sim is
component Mux_2_to_1_3bit
port(
    S : in STD_LOGIC;
    EN : in STD_LOGIC;
    D0 : in STD_LOGIC_VECTOR;
    D1 : in STD_LOGIC_VECTOR;
    Y : out STD_LOGIC_VECTOR);
end component;

signal S : STD_LOGIC;
signal EN : STD_LOGIC;
signal D0 : STD_LOGIC_VECTOR(2 downto 0);
signal D1 : STD_LOGIC_VECTOR(2 downto 0);
signal Y : STD_LOGIC_VECTOR(2 downto 0);

begin
UUT : Mux_2_to_1_3bit PORT MAP(
    S => S,
    EN => EN,
    D0 => D0,
    D1 => D1,
    Y => Y);
    
process begin
    EN <= '0';
    D0 <= "001";
    D1 <= "101";
    wait for 100 ns;
    
    EN <= '1';
    S <= '0';
    wait for 100 ns;
    
    S <= '1';
    wait for 100 ns;
    
    D0 <= "011";
    D1 <= "111";
    wait for 100 ns;
    
    EN <= '1';
    S <= '0';
    wait for 100 ns;
    
    S <= '1';
    wait;
end process;
    
end Behavioral;
