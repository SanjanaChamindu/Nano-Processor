----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 02:12:32 PM
-- Design Name: 
-- Module Name: ROM_12 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM_12 is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data_out : out STD_LOGIC_VECTOR (11 downto 0)); -- Set rreset button
end ROM_12;

architecture Behavioral of ROM_12 is
type rom_type is array(0 to 7) of std_logic_vector(11 downto 0);
constant rom : rom_type :=(
    "101110000000",
    "101100000001",
    "101010000010",
    "101000000011",
    "001111100000",
    "001111010000",
    "001111000000",
    "000000000000");
    --"101110001111",
    --"101100000001",
    --"001111100001",
    --"111111000010",
    --"000000000000",
    --"000000000000",
    --"000000000000",
    --"000000000000");

begin

    data_out <= rom(to_integer(unsigned(address)));

end Behavioral;
