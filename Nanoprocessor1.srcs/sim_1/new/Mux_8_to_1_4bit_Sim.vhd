----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2023 11:29:45 PM
-- Design Name: 
-- Module Name: Mux_8_to_1_4bit_Sim - Behavioral
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

entity Mux_8_to_1_4bit_Sim is
--  Port ( );
end Mux_8_to_1_4bit_Sim;

architecture Behavioral of Mux_8_to_1_4bit_Sim is
component Mux_8_to_1_4bit
port(
    S : in STD_LOGIC_VECTOR;
    EN : in STD_LOGIC;
    D0 : in STD_LOGIC_VECTOR;
    D1 : in STD_LOGIC_VECTOR;
    D2 : in STD_LOGIC_VECTOR;
    D3 : in STD_LOGIC_VECTOR;
    D4 : in STD_LOGIC_VECTOR;
    D5 : in STD_LOGIC_VECTOR;
    D6 : in STD_LOGIC_VECTOR;
    D7 : in STD_LOGIC_VECTOR;
    Y : out STD_LOGIC_VECTOR);
END COMPONENT;

signal S : STD_LOGIC_VECTOR(2 downto 0);
signal EN : STD_LOGIC;
signal D0 : STD_LOGIC_VECTOR(3 downto 0);
signal D1 : STD_LOGIC_VECTOR(3 downto 0);
signal D2 : STD_LOGIC_VECTOR(3 downto 0);
signal D3 : STD_LOGIC_VECTOR(3 downto 0);
signal D4 : STD_LOGIC_VECTOR(3 downto 0);
signal D5 : STD_LOGIC_VECTOR(3 downto 0);
signal D6 : STD_LOGIC_VECTOR(3 downto 0);
signal D7 : STD_LOGIC_VECTOR(3 downto 0);
signal Y : STD_LOGIC_VECTOR(3 downto 0);

begin
UUT : Mux_8_to_1_4bit PORT MAP(
    S => S,
    EN => EN,
    D0 => D0,
    D1 => D1,
    D2 => D2,
    D3 => D3,
    D4 => D4,
    D5 => D5,
    D6 => D6,
    D7 => D7,
    Y => Y);
    
process begin
    EN <= '1';
    
    D0(0) <= '0';
    D0(1) <= '0';
    D0(2) <= '0';
    D0(3) <= '0';
    
    D1(0) <= '0';
    D1(1) <= '1';
    D1(2) <= '0';
    D1(3) <= '0';
    
    D2(0) <= '0';
    D2(1) <= '0';
    D2(2) <= '1';
    D2(3) <= '0';
    
    D3(0) <= '0';
    D3(1) <= '1';
    D3(2) <= '1';
    D3(3) <= '0';
    
    D4(0) <= '0';
    D4(1) <= '0';
    D4(2) <= '0';
    D4(3) <= '1';
    
    D5(0) <= '0';
    D5(1) <= '1';
    D5(2) <= '0';
    D5(3) <= '1';
    
    D6(0) <= '0';
    D6(1) <= '0';
    D6(2) <= '1';
    D6(3) <= '1';
    
    D7(0) <= '0';
    D7(1) <= '1';
    D7(2) <= '1';
    D7(3) <= '1';
    
    S(0) <= '0';
    S(1) <= '0';
    S(2) <= '0';
    wait for 100 ns;
    
    S(0) <= '1';
    S(1) <= '0';
    S(2) <= '0';
    wait for 100 ns;
    
    S(0) <= '0';
    S(1) <= '1';
    S(2) <= '0';
    wait for 100 ns;
    
    S(0) <= '1';
    S(1) <= '1';
    S(2) <= '0';
    wait for 100 ns;
    
    S(0) <= '0';
    S(1) <= '0';
    S(2) <= '1';
    wait for 100 ns;
    
    S(0) <= '1';
    S(1) <= '0';
    S(2) <= '1';
    wait for 100 ns;
    
    S(0) <= '0';
    S(1) <= '1';
    S(2) <= '1';
    wait for 100 ns;
    
    S(0) <= '1';
    S(1) <= '1';
    S(2) <= '1';
    wait;

end process;
end Behavioral;
    
