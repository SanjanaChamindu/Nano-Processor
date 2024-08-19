----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2023 04:08:08 PM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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

entity LUT_16_7 is
    Port ( address0 : in STD_LOGIC_VECTOR (3 downto 0);
           address1 : in STD_LOGIC_VECTOR (3 downto 0);
           address2 : in STD_LOGIC_VECTOR (3 downto 0);
           address3 : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           data : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR(3 downto 0):="1110");
end LUT_16_7;

architecture Behavioral of LUT_16_7 is

signal clk_count : integer := 1;
signal data0, data1, data2, data3 : STD_LOGIC_VECTOR (6 downto 0);

type rom_type is array (0 to 15) of std_logic_vector (6 downto 0);
signal sevsnSegment_ROM : rom_type := (
                        "1000000", -- 0
                        "1111001", -- 1
                        "0100100", -- 2
                        "0110000", -- 3
                        "0011001", -- 4
                        "0010010", -- 5
                        "0000010", -- 6
                        "1111000", -- 7
                        "0000000", -- 8
                        "0010000", -- 9
                        "0001000", -- 10 a
                        "0000011", -- 11 b
                        "1000110", -- 12 c
                        "0100001", -- 13 d
                        "0000110", -- 14 e
                        "0001110" --  15 f
                        );
begin
process(Clk, clk_count) begin
    if (rising_edge(Clk)) then
        data0 <= sevsnSegment_ROM(to_integer(unsigned(address0)));
        data1 <= sevsnSegment_ROM(to_integer(unsigned(address1)));
        data2 <= sevsnSegment_ROM(to_integer(unsigned(address2)));
        data3 <= sevsnSegment_ROM(to_integer(unsigned(address3)));
        clk_count <= clk_count + 1;
        if (clk_count <= 10000) then
            data <= data0;
            Anode <= "1110";
        elsif (clk_count <= 20000) then
            data <= data1;
            Anode <= "1101";
        elsif (clk_count <= 30000) then
            data <= data2;
            Anode <= "1011";
        elsif (clk_count <= 40000) then
            data <= data3;
            Anode <= "0111";
        else
            clk_count <= 1;                    
        end if;
    end if;
end process;
end Behavioral;
