----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 01:07:52 AM
-- Design Name: 
-- Module Name: RCA_4_Sim - Behavioral
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

entity RCA_4_Sim is
--  Port ( );
end RCA_4_Sim;

architecture Behavioral of RCA_4_Sim is
component RCA_4
port( A, B : in STD_LOGIC_VECTOR;
      M : in STD_LOGIC;
      S : out STD_LOGIC_VECTOR;
      Z : out STD_LOGIC;
      OverFlow : out STD_LOGIC);
end component;

signal A, B, S : STD_LOGIC_VECTOR(3 downto 0);
signal M, Z, OverFlow : STD_LOGIC;

begin
UUT: RCA_4 port map(
    A => A,
    B => B,
    S => S,
    M => M,
    Z => Z,
    OverFlow => OverFlow);
    
process begin
    M <= '0';
    A <= "0011";
    B <= "0001";
    wait for 100 ns;
    
    M <= '1';
    wait for 100 ns;
    
    A <= "1111";
    B <= "1001";
    M <= '0';
    wait for 100 ns;
    
    M <= '1';
    wait for 100 ns;
    
    A <= "0111";
    B <= "1001";
    M <= '0';
    wait for 100 ns;
    
    M <= '1';
    wait;
    
end process;

end Behavioral;
