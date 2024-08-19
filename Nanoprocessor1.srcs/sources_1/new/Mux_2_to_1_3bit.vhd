----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2023 11:01:44 PM
-- Design Name: 
-- Module Name: Mux_2_to_1_3bit - Behavioral
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

entity Mux_2_to_1_3bit is
    Port ( D0 : in STD_LOGIC_VECTOR (2 downto 0);
           D1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_to_1_3bit;

architecture Behavioral of Mux_2_to_1_3bit is
component Mux_2_to_1 is
    port( D : in STD_LOGIC_VECTOR;
          S : in STD_LOGIC;
          EN : in STD_LOGIC;
          Y : out STD_LOGIC);
end component;

begin

    Mux_2_to_1_0 : Mux_2_to_1
    port map(
        D(0) => D1(0),
        D(1) => D0(0),
        EN => EN,
        S => S,
        Y => Y(0));
        
    Mux_2_to_1_1 : Mux_2_to_1
    port map(
        D(0) => D1(1),
        D(1) => D0(1),
        EN => EN,
        S => S,
        Y => Y(1));
        
    Mux_2_to_1_2 : Mux_2_to_1
    port map(
        D(0) => D1(2),
        D(1) => D0(2),
        EN => EN,
        S => S,
        Y => Y(2));

end Behavioral;
