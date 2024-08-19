----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2023 12:20:15 AM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Select : out STD_LOGIC;
           Immediate_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel1 : out STD_LOGIC_VECTOR (2 downto 0);
           Add_sub : out STD_LOGIC;
           Jump_flg : out STD_LOGIC;
           Address_jmp : out STD_LOGIC_VECTOR (2 downto 0);
           Register_check : in STD_LOGIC_VECTOR(3 downto 0);
           Reg_Sel2 : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin
    process(I(11 downto 0), Register_check) begin   
            if I(11 downto 10) = "00" then
                if I(9 downto 0) /= "0000000000" then
                    Reg_Sel1 <= I(9 downto 7);
                    Reg_Sel2 <= I(6 downto 4);
                    Reg_En <= I(9 downto 7);
                    if I(0) = '1' then
                        Add_sub <= '1';     -- 0 for ADD
                    else
                        Add_sub <= '0';
                    end if;
                    Load_Select <= '1'; -- When it is 1 Add/Sub bus activated
                    Jump_flg <= '0';    -- 0 if deactivated
                else
                    Jump_flg <= '1';
                    Reg_En <= "000";
                    Address_jmp <= "111";
                 end if;
                
            elsif I(11 downto 10) = "01" then
                Reg_Sel1 <= "000";
                Reg_Sel2 <= I(9 downto 7);
                Add_sub <= '1';
                Reg_En <= I(9 downto 7);
                Load_Select <= '1';
                Jump_flg <= '0';
                
            elsif I(11 downto 10) = "10" then
                Reg_En <= I(9 downto 7);
                Immediate_Val <= I(3 downto 0);
                Load_Select <= '0'; -- When it is 0 Immediate value activated
                Jump_flg <= '0';    -- 0 if deactivated
            else
                Reg_En <= I(9 downto 7);
                Reg_Sel1 <= I(9 downto 7);
                Immediate_Val <= Register_check;
                Load_Select <= '0';
                if I(6) = '0' then
                    if Register_check = "0000" then
                        Jump_flg <= '1';
                        Address_jmp <= I(2 downto 0);
                    else
                        Jump_flg <= '0';
                    end if;
                 else
                    if Register_check = "0000" then
                         Jump_flg <= '0';
                    else
                         Jump_flg <= '1';
                         Address_jmp <= I(2 downto 0);
                     end if;
                 end if;     
            end if;
    end process;

end Behavioral;
