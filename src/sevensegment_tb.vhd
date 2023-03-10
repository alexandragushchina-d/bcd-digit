library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sevensegment_tb is
end sevensegment_tb;

architecture behavior of sevensegment_tb is

    component countdown is 
    port(
        clk : in std_logic;
        value : out unsigned(3 downto 0);
        bcd : out std_logic
        );
    end component;

    component sevensegment is
    port(
        clk : in std_logic;
        value : in unsigned(3 downto 0);
        bcd : in std_logic;
        segments : out std_logic_vector(6 downto 0)
        );
    end component;

    signal clk : std_logic;
    signal value : unsigned(3 downto 0);
    signal bcd : std_logic;
    signal segments: std_logic_vector(6 downto 0);
    constant clk_period : time := 2 fs;

begin
    comp1: countdown port map (clk => clk, value => value, bcd => bcd);
  
    comp2: sevensegment port map (clk => clk, value => value, bcd => bcd, segments => segments);

  process
  begin
      clk <= '0';
      wait for clk_period/2;
	  clk <= '1';
      wait for clk_period/2;
  end process;

end architecture;
