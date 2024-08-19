----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 10:55:21 AM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

entity RCA_3 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC);
end RCA_3;

architecture Behavioral of RCA_3 is
component FA port(
    A : in STD_LOGIC;
    B : in STD_LOGIC;
    Cin : in STD_LOGIC;
    S : out STD_LOGIC;
    Cout : out STD_LOGIC);
end component;

signal F, Sout : STD_LOGIC_VECTOR(2 downto 0);

begin

FA_0 : FA
    port map(
    A => A(0),
    B => B(0),
    Cin => '0',
    S => Sout(0),
    Cout => F(0));
    
FA_1 : FA
    port map(
    A => A(1),
    B => B(1),
    Cin => F(0),
    S => Sout(1),
    Cout => F(1));
    
FA_2 : FA
    port map(
    A => A(2),
    B => B(2),
    Cin => F(1),
    S => Sout(2),
    Cout => F(2));
    
S <= Sout;
Cout <= F(2);

end Behavioral;
