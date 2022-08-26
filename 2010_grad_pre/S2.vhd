Library IEEE;
use IEEE.std_Logic_1164.all;
use IEEE.numeric_std.all;

entity S2 is
  port (
    clk        : in std_logic;
    rst        : in std_logic;
    updown     : in std_logic;
    S2_done    : out std_logic;
    RB2_RW     : out std_logic;
    RB2_A      : out std_logic_vector(2 downto 0);
    RB2_D      : out std_logic_vector(17 downto 0);
    RB2_Q      : in std_logic_vector(17 downto 0);
    sd         : inout std_logic;
    sen        : inout std_logic;
    );
end S2;

architecture S2_arc of S2 is

begin

end S2_arc;