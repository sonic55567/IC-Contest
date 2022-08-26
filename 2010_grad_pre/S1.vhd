Library IEEE;
use IEEE.std_Logic_1164.all;
use IEEE.numeric_std.all;

entity S1 is
  port (
    clk        : in std_logic;
    rst        : in std_logic;
    updown     : in std_logic;
    S1_done    : out std_logic;
    RB1_RW     : out std_logic;
    RB1_A      : out std_logic_vector(4 downto 0);
    RB1_D      : out std_logic_vector(7 downto 0);
    RB1_Q      : in std_logic_vector(7 downto 0);
    sd         : inout std_logic;
    sen        : inout std_logic;
    );
end S1;

architecture S1_arc of S1 is

begin

end S1_arc;