----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:04:47 PM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
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
           Reset : in STD_LOGIC);
end RegisterBank;

architecture Behavioral of RegisterBank is
component Reg port(
    D : in STD_LOGIC_VECTOR;
    En : in STD_LOGIC;
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR);
end component;

component Decoder_3_to_8 port(
    I : in STD_LOGIC_VECTOR;
    Y : out STD_LOGIC_VECTOR;
    EN : in STD_LOGIC);
end component;

signal RegSel : STD_LOGIC_VECTOR(7 downto 0);

begin
    Decorder_3_to_8_0 : Decoder_3_to_8
    port map(
    I => RegEn,
    En => '1',
    Y => RegSel);
    
    Reg_0 : Reg
    port map(
    D => "0000",
    En => '1',
    Reset => Reset,
    Clk => Clk,
    Q => Out0);
    
    Reg_1 : Reg
    port map(
    D => I,
    En => RegSel(1),
    Reset => Reset,
    Clk => Clk,
    Q => Out1);
    
    Reg_2 : Reg
    port map(
    D => I,
    En => RegSel(2),
    Reset => Reset,
    Clk => Clk,
    Q => Out2);
    
    Reg_3 : Reg
    port map(
    D => I,
    En => RegSel(3),
    Reset => Reset,
    Clk => Clk,
    Q => Out3);
    
    Reg_4 : Reg
    port map(
    D => I,
    En => RegSel(4),
    Reset => Reset,
    Clk => Clk,
    Q => Out4);
    
    Reg_5 : Reg
    port map(
    D => I,
    En => RegSel(5),
    Reset => Reset,
    Clk => Clk,
    Q => Out5);
    
    Reg_6 : Reg
    port map(
    D => I,
    En => RegSel(6),
    Reset => Reset,
    Clk => Clk,
    Q => Out6);

    Reg_7 : Reg
    port map(
    D => I,
    En => RegSel(7),
    Reset => Reset,
    Clk => Clk,
    Q => Out7);
    
end Behavioral;
