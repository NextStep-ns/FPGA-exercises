library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Ex3 is
Port ( clk : in STD_LOGIC;
		 sout : out std_logic_vector(13 downto 0);
		 A : in std_logic;
		 B : in std_logic);
end Ex3;

architecture Behavioral of Ex3 is
Signal s_sout : std_logic_vector(3 downto 0);
SIGNAL s_sout2: STD_LOGIC_VECTOR (13 downto 0);

SIGNAL cnt : integer:=1;
Signal clk_1Hz : std_logic;

Begin
process(clk)
Begin
if clk'event and clk = '1' then

    cnt <= cnt + 1;
    if cnt = 25000000 then
        clk_1Hz <= not clk_1Hz;
        cnt <= 1;
    end if;
end if;
End Process;

Process(clk_1Hz)
Begin
	if clk_1Hz'event and clk_1Hz = '1' then

		if B='1' then
			if s_sout>0 then
				s_sout <= s_sout - '1';
				if A ='1' then
					s_sout <="1010";
				end if;
			else
				s_sout <="1010";
			end if;

			
		
		elsif B='0' then 
			if s_sout<10 then
				s_sout <= s_sout + '1';
				if A ='1' then
					s_sout <="0000";
				end if;
			else 
				s_sout <= "0000";
			end if;
		end if;
	end if;

case (s_sout) is
      when "0000" => s_sout2 <= "00000011111111";
      when "0001" => s_sout2 <= "10011111111111";
      when "0010" => s_sout2 <= "00100101111111";
      when "0011" => s_sout2 <= "00001101111111";
		when "0100" => s_sout2 <= "10011001111111";
      when "0101" => s_sout2 <= "01001001111111";
      when "0110" => s_sout2 <= "01000001111111";
      when "0111" => s_sout2 <= "00011111111111";
      when "1000" => s_sout2 <= "00000001111111";
      when "1001" => s_sout2 <= "00001001111111";
      when "1010" => s_sout2 <= "00000011001111";
      when "1011" => s_sout2 <= "10011111001111";
      when "1100" => s_sout2 <= "00100101001111";
      when "1101" => s_sout2 <= "00001101001111";
      when "1110" => s_sout2 <= "10011001001111";
      when "1111" => s_sout2 <= "01001001001111";
		when others => null;
end case;
End Process;
sout<=s_sout2;
End Behavioral;
