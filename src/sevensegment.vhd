library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sevensegment is
port(
        VALUE : in unsigned(3 downto 0);
        BCD : in std_logic;
        CLK : in std_logic;
        SEGMENTS : out std_logic_vector(6 downto 0)
    );
end entity;

architecture v1 of sevensegment is
    type rom_type is array(0 to 9) of std_logic_vector(6 downto 0);
    signal rom: rom_type :=("1111110","0110000","1101101","1111001","0110011","1011011","1011111","1110000","1111111","1111011");
    function to_integer(n: unsigned(3 downto 0)) return integer is
    begin
      if n = "0000" then return 0;
      elsif n = "0001" then return 1;
      elsif n = "0010" then return 2;
      elsif n = "0011" then return 3;
      elsif n = "0100" then return 4;
      elsif n = "0101" then return 5;
      elsif n = "0110" then return 6;
      elsif n = "0111" then return 7;
      elsif n = "1000" then return 8;
      elsif n = "1001" then return 9;
      end if;
    end;

-- Position in a 7-segment

--  ----6----
--  |       |
--  1       5
--  |       |
--  ----0----
--  |       |
--  2       4
--  |       |
--  ----3----
--
-- So 0: 1111110
--    9: 1111011
begin
  process (CLK)
  begin
    if rising_edge(CLK) then
      if BCD = '1' then
         SEGMENTS <= rom(to_integer(VALUE));
      end if;
    end if;
  end process;

end architecture;
