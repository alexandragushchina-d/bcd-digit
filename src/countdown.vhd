library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity countdown is
port(
        clk : in std_logic;
        value : out unsigned(3 downto 0);
        bcd : out std_logic
    );
end entity;

architecture behaviour of countdown is
    signal z: unsigned(3 downto 0) := "1010";
begin
    bcd <= '1' when z <= 9 else '0';
    value <= z;

    process(clk)
    begin
        if rising_edge(clk) then
            z <= z-1;
        end if;
    end process;
end architecture;
