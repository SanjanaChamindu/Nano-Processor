----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2023 06:39:59 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
    component Decoder_3_to_8
    port(
        I : in STD_LOGIC_VECTOR;
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR);
    end component;
    signal Y0 : STD_LOGIC_VECTOR(7 downto 0);

begin
    Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
    I => S,
    EN => EN,
    Y => Y0);
    
    Y <= (Y0(0) AND D(0)) OR (Y0(1) AND D(1)) OR (Y0(2) AND D(2)) OR (Y0(3) AND D(3)) OR (Y0(4) AND D(4)) OR (Y0(5) AND D(5)) OR (Y0(6) AND D(6)) OR (Y0(7) AND D(7));


end Behavioral;
