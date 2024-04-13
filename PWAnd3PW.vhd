library IEEE;
use ieee.std_logic_1164.all;

Entity PWAnd3PW is
end PWAnd3PW;

architecture DESCRIPTION of PWAnd3PW is 

Component PW5
Port ( A,B,C :  in STD_LOGIC;
		F : out STD_LOGIC);
end Component;

-- INPUTS
signal A :  std_logic := '0';
signal B :  std_logic := '0';
signal C :  std_logic := '0';
-- OUTPUT
signal F :  std_logic;

Begin

Uut : PW5 port map
(	A=> A,
	B=>B, 
	C=>C, 
	F=>F);
	
 stim_proc:process
 begin

 wait for 100 ns;

 A<='1'; B<='0'; C<='1'; wait for 20 ns;
 A<='0'; B<='1'; C<='0'; wait for 30 ns;
 A<='1'; B<='1'; C<='1'; wait for 40 ns;
 
 wait;

end process;

end;	
