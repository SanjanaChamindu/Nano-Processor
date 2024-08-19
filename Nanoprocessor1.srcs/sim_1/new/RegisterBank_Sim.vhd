----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:32:25 PM
-- Design Name: 
-- Module Name: RegisterBank_Sim - Behavioral
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

entity RegisterBank_Sim is
--  Port ( );
end RegisterBank_Sim;

architecture Behavioral of RegisterBank_Sim is
component RegisterBank port(
    I : in STD_LOGIC_VECTOR (3 downto 0);
    Out0 : out STD_LOGIC_VECTOR (3 downto 0);
    Out1 : out STD_LOGIC_VECTOR (3 downto 0);
    Out2 : out STD_LOGIC_VECTOR (3 downto 0);
    Out3 : out STD_LOGIC_VECTOR (3 downto 0);
    Out4 : out STD_LOGIC_VECTOR (3 downto 0);
    Out5 : out STD_LOGIC_VECTOR (3 downto 0);
    Out6 : out STD_LOGIC_VECTOR (3 downto 0);
    Out7 : out STD_LOGIC_VECTOR (3 downto 0);
    Clk : in STD_LOGIC;
    RegEn : in STD_LOGIC_VECTOR (2 downto 0);
    Reset : in STD_LOGIC:= '0');
end component;

signal I, Out0, Out1, Out2, Out3, Out4, Out5, Out6, Out7 : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal Clk, Reset : STD_LOGIC := '1';
signal RegEn : STD_LOGIC_VECTOR(2 downto 0);

begin
    UUT: RegisterBank
    port map(
    I => I,
    Out0 => Out0,
    Out1 => Out1,
    Out2 => Out2,
    Out3 => Out3,
    Out4 => Out4,
    Out5 => Out5,
    Out6 => Out6,
    Out7 => Out7,
    Clk => Clk,
    RegEn => RegEn,
    Reset => Reset);
    
process begin
    Clk <= NOT(Clk);
    wait for 5 ns;
end process;

process begin
    Reset <= '0';
    I <= "0001";
    RegEn <= "001";
    wait for 100 ns;
    
    I <= "0010";
    RegEn <= "010";
    wait for 100 ns; 
    
    I <= "0011";
    RegEn <= "011";
    wait for 100 ns;
    
    I <= "0100";
    RegEn <= "100";
    wait for 100 ns;
    
    I <= "0101";
    RegEn <= "101";
    wait for 100 ns; 
    
    I <= "0110";
    RegEn <= "110";
    wait for 100 ns;
    
    I <= "0111";
    RegEn <= "111";
    wait for 100 ns;
    
    I <= "1000";
    RegEn <= "100";
    wait for 100 ns;
    
    Reset <= '1';
    wait for 100 ns;
    
    Reset <= '0';
    I <= "1111";
    RegEn <= "001";
    wait;
    
end process;  

end Behavioral;
