----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 11:19:54 AM
-- Design Name: 
-- Module Name: RCA_3_Sim - Behavioral
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

entity RCA_3_Sim is
--  Port ( );
end RCA_3_Sim;

architecture Behavioral of RCA_3_Sim is
component RCA_3
port(A, B : in STD_LOGIC_VECTOR;
     S : out STD_LOGIC_VECTOR;
     Cout : out STD_LOGIC);
end component;

signal A, B, S : STD_LOGIC_VECTOR(2 downto 0);
signal Cout : STD_LOGIC;

begin
UUT : RCA_3 port map(
    A => A,
    B => B,
    S => S,
    Cout => Cout);
    
process begin
    A <= "010";
    B <= "101";
    wait for 100 ns;
    
    A <= "001";
    B <= "110";
    wait for 100 ns;
    
    A <= "110";
    B <= "101";
    wait for 100 ns;
    
    A <= "110";
    B <= "111";
    wait for 100 ns;
    
    A <= "011";
    B <= "110";
    wait for 100 ns;
    
    A <= "111";
    B <= "111";
    wait;
    
end process;

end Behavioral;
