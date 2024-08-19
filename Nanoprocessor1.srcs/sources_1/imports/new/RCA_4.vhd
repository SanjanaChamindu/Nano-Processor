----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2023 08:22:41 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR(3 downto 0);
           Z : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
           
end RCA_4;

architecture Behavioral of RCA_4 is

    component FA
        port (
        A : in std_logic;
        B : in std_logic;
        Cin : in std_logic;
        S : out std_logic;
        Cout : out std_logic);
    end component; 

signal F, Fin, Sout : STD_LOGIC_VECTOR(3 downto 0);    

begin
    FA_0 : FA
        port map(
            A => A(0),
            B => Fin(0),
            Cin => M,
            S => Sout(0),
            Cout => F(0));
    FA_1 : FA
        port map(
            A => A(1),
            B => Fin(1),
            Cin => F(0),
            S => Sout(1),
            Cout => F(1));
    FA_2 : FA
        port map(
            A => A(2),
            B => Fin(2),
            Cin => F(1),
            S => Sout(2),
            Cout => F(2));
    FA_3 : FA
        port map(
            A => A(3),
            B => Fin(3),
            Cin => F(2),
            S => Sout(3),
            Cout => F(3));
    
    Fin(0) <= M XOR B(0);
    Fin(1) <= M XOR B(1);
    Fin(2) <= M XOR B(2);
    Fin(3) <= M XOR B(3);
    OverFlow <= F(2) XOR F(3);
    Z <= (NOT Sout(0)) AND (NOT Sout(1)) AND (NOT Sout(2)) AND (NOT Sout(3));
    S <= Sout;

end Behavioral;
