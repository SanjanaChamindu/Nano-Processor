----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 01:38:01 PM
-- Design Name: 
-- Module Name: Nanoprocessor - Behavioral
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

entity Nanoprocessor is
    Port ( Real_clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Reg7_out : out STD_LOGIC_VECTOR (3 downto 0);
           SS_out : out STD_LOGIC_VECTOR(6 downto 0);
           Anode : out STD_LOGIC_VECTOR(3 downto 0));
end Nanoprocessor;

architecture Behavioral of Nanoprocessor is
component RCA_3 port(
    A : in STD_LOGIC_VECTOR;
    B : in STD_LOGIC_VECTOR;
    S : out STD_LOGIC_VECTOR;
    Cout : out STD_LOGIC);
end component;

component Mux_2_to_1_4bit port(
    D0 : in STD_LOGIC_VECTOR;
    D1 : in STD_LOGIC_VECTOR;
    S : in STD_LOGIC;
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR);
end component;

component Mux_8_to_1_4bit port(
    D0 : in STD_LOGIC_VECTOR;
    D1 : in STD_LOGIC_VECTOR;
    D2 : in STD_LOGIC_VECTOR;
    D3 : in STD_LOGIC_VECTOR;
    D4 : in STD_LOGIC_VECTOR;
    D5 : in STD_LOGIC_VECTOR;
    D6 : in STD_LOGIC_VECTOR;
    D7 : in STD_LOGIC_VECTOR;
    EN : in STD_LOGIC;
    S : in STD_LOGIC_VECTOR;
    Y : out STD_LOGIC_VECTOR);
end component;

component RCA_4 port(
    A : in STD_LOGIC_VECTOR;
    B : in STD_LOGIC_VECTOR;
    M : in STD_LOGIC;
    S : out STD_LOGIC_VECTOR;
    Z : out STD_LOGIC;
    OverFlow : out STD_LOGIC);
end component;

component Mux_2_to_1_3bit port(
    D0 : in STD_LOGIC_VECTOR;
    D1 : in STD_LOGIC_VECTOR;
    S : in STD_LOGIC;
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR);
end component;

component Instruction_Decoder port(
    I : in STD_LOGIC_VECTOR;
    Reg_En : out STD_LOGIC_VECTOR;
    Load_Select : out STD_LOGIC;
    Immediate_Val : out STD_LOGIC_VECTOR;
    Reg_Sel1 : out STD_LOGIC_VECTOR;
    Add_sub : out STD_LOGIC;
    Jump_flg : out STD_LOGIC;
    Address_jmp : out STD_LOGIC_VECTOR;
    Register_check : in STD_LOGIC_VECTOR;
    Reg_Sel2 : out STD_LOGIC_VECTOR);
end component;

component ROM_12 port(
    address : in STD_LOGIC_VECTOR;
    data_out : out STD_LOGIC_VECTOR);
end component;

component Slow_Clk port(
    Clk_in : in STD_LOGIC;
    Clk_out : out STD_LOGIC);
end component;

component RegisterBank port(
    I : in STD_LOGIC_VECTOR;
    Out0 : out STD_LOGIC_VECTOR;
    Out1 : out STD_LOGIC_VECTOR;
    Out2 : out STD_LOGIC_VECTOR;
    Out3 : out STD_LOGIC_VECTOR;
    Out4 : out STD_LOGIC_VECTOR;
    Out5 : out STD_LOGIC_VECTOR;
    Out6 : out STD_LOGIC_VECTOR;
    Out7 : out STD_LOGIC_VECTOR;
    Clk : in STD_LOGIC;
    RegEn : in STD_LOGIC_VECTOR;
    Reset : in STD_LOGIC);
end component;

component Program_Counter port(
    I : in STD_LOGIC_VECTOR;
    Output : out STD_LOGIC_VECTOR;
    Clk : in STD_LOGIC;
    Reset : in STD_LOGIC);
end component;

component LUT_16_7 port(
    address0 : in STD_LOGIC_VECTOR;
    address1 : in STD_LOGIC_VECTOR;
    address2 : in STD_LOGIC_VECTOR;
    address3 : in STD_LOGIC_VECTOR;
    Clk : in STD_LOGIC;
    Anode : out STD_LOGIC_VECTOR;
    data : out STD_LOGIC_VECTOR);
    
end component;

signal Register_enable, Reg_Sel0, Reg_Sel1, Address_to_jmp, Memory_Select : STD_LOGIC_VECTOR(2 downto 0);
signal Addar_out3, Mux_out3 : STD_LOGIC_VECTOR(2 downto 0);
signal Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7, Mux_out0, Mux_out1 : STD_LOGIC_VECTOR(3 downto 0);
signal Mux_out2, Addar_out, Immediate_val, Anode1 : STD_LOGIC_VECTOR(3 downto 0);
signal Instruction_Bus : STD_LOGIC_VECTOR(11 downto 0);
signal SSout : STD_LOGIC_VECTOR(6 downto 0);
signal Load_Sel, Add_Sub, Jmp_flg, Clk : STD_LOGIC;

signal I : STD_LOGIC_VECTOR(11 downto 0);

begin
Slow_Clk_0 : Slow_Clk
port map(
    Clk_in => Real_clk,
    Clk_out => Clk);

Instruction_Decoder_0 : Instruction_Decoder
port map(
    I => Instruction_Bus,
    Register_check => Mux_out0,
    Reg_En => Register_enable,
    Load_Select => Load_Sel,
    Immediate_Val => Immediate_val,
    Reg_Sel1 => Reg_Sel0,
    Reg_Sel2 => Reg_Sel1,
    Add_sub => Add_Sub,
    Jump_flg => Jmp_flg,
    Address_jmp => Address_to_jmp);
    
RegisterBank_0 : RegisterBank
port map(
    I => Mux_out2,
    Out0 => Reg0,
    Out1 => Reg1,
    Out2 => Reg2,
    Out3 => Reg3,
    Out4 => Reg4,
    Out5 => Reg5,
    Out6 => Reg6,
    Out7 => Reg7,
    Clk => Clk,
    RegEn => Register_enable,
    Reset => Reset);

RCA_4_0 : RCA_4
port map(
    A => Mux_out0,
    B => Mux_out1,
    M => Add_Sub,
    S => Addar_out,
    Z => Zero,
    OverFlow => OverFlow);
    
Mux_8_to_1_4bit_0 : Mux_8_to_1_4bit
port map(
    D0 => Reg0,
    D1 => Reg1,
    D2 => Reg2,
    D3 => Reg3,
    D4 => Reg4,
    D5 => Reg5,
    D6 => Reg6,
    D7 => Reg7,
    EN => '1',
    S => Reg_Sel0,
    Y => Mux_out0);
    
Mux_8_to_1_4bit_1 : Mux_8_to_1_4bit
port map(
    D0 => Reg0,
    D1 => Reg1,
    D2 => Reg2,
    D3 => Reg3,
    D4 => Reg4,
    D5 => Reg5,
    D6 => Reg6,
    D7 => Reg7,
    EN => '1',
    S => Reg_Sel1,
    Y => Mux_out1);
        
Mux_2_to_1_4bit_0 : Mux_2_to_1_4bit
port map(
    D0 => Immediate_val,
    D1 => Addar_out,
    S => Load_Sel,
    EN => '1',
    Y => Mux_out2);
    
ROM_12_0 : ROM_12
port map(
    address => Memory_Select,
    data_out => Instruction_Bus);
    
RCA_3_0 : RCA_3
port map(
    A => Memory_Select,
    B => "001",
    S => Addar_out3);
    
Mux_2_to_1_3bit_0 : Mux_2_to_1_3bit
port map(
    D0 => Addar_out3,
    D1 => Address_to_jmp,
    S => Jmp_flg,
    EN => '1',
    Y => Mux_out3);
    
Program_Counter_0 : Program_Counter
port map(
    I => Mux_out3,
    Output => Memory_Select,
    Clk => Clk,
    Reset => Reset);
    
LUT_16_7_0 : LUT_16_7
port map(
    address0 => Reg7,
    address1 => Reg6,
    address2 => Reg5,
    address3 => Reg4,
    Clk => Real_clk,
    Anode => Anode1,
    data => SSout);
    
Reg7_out <= Reg7;
SS_out <= SSout;
Anode <= Anode1;

end Behavioral;
