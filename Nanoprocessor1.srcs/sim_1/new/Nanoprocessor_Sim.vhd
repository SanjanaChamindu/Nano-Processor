----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/26/2023 10:33:59 AM
-- Design Name: 
-- Module Name: Nanoprocessor_Sim - Behavioral
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

entity Nanoprocessor_Sim is
--  Port ( );
end Nanoprocessor_Sim;

architecture Behavioral of Nanoprocessor_Sim is
component Nanoprocessor port(
    Real_clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    OverFlow : out STD_LOGIC;
    Zero : out STD_LOGIC;
    Reg7_out : out STD_LOGIC_VECTOR (3 downto 0);
    SS_out : out STD_LOGIC_VECTOR(6 downto 0);
    Anode : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal Real_clk, Reset, Overflow, Zero, Jmp_flg_temp : STD_LOGIC:='0';
signal Reg7_out, Anode : STD_LOGIC_VECTOR(3 downto 0);
signal SS_out : STD_LOGIC_VECTOR(6 downto 0);


begin
UUT : Nanoprocessor
port map(
    Real_clk => Real_clk,
    Reset => Reset,
    OverFlow => OverFlow,
    Zero => Zero,
    Reg7_out => Reg7_out,
    Anode => Anode,
    SS_out => SS_out);

process begin
    Real_clk <= NOT(Real_clk);
    wait for 1 ns;
end process;

process begin
    Reset <= '0';
    wait for 800 ns;
    
    Reset <= '1';
    wait for 100 ns;
end process;

end Behavioral;
