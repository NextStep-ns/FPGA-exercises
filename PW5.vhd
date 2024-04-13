library IEEE;
use ieee.std_logic_1164.all;

Entity TP5 is

Port ( A,B,C :  in STD_LOGIC;
		F : out STD_LOGIC);
end TP5;

architecture Behavioral of TP5 is 

Begin

F<=A and B and C;

end Behavioral;
