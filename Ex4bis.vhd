library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

Entity Ex4 is

Port ( clk, raz	: in STD_LOGIC;
		SEG1: out STD_LOGIC_VECTOR(6 downto 0);
		SEG2: out STD_LOGIC_VECTOR(6 downto 0);
		SEG3: out STD_LOGIC_VECTOR(6 downto 0);
		SEG4: out STD_LOGIC_VECTOR(6 downto 0));
end Ex4;

architecture Behavioral of Ex4 is 

Signal INPUT1 : STD_LOGIC_VECTOR(3 downto 0);
Signal INPUT2 : STD_LOGIC_VECTOR(3 downto 0);
Signal INPUT3 : STD_LOGIC_VECTOR(3 downto 0);
Signal INPUT4 : STD_LOGIC_VECTOR(3 downto 0);

Signal sout1 : STD_LOGIC_VECTOR(6 downto 0);
Signal sout2 : STD_LOGIC_VECTOR(6 downto 0);
Signal sout3 : STD_LOGIC_VECTOR(6 downto 0);
Signal sout4 : STD_LOGIC_VECTOR(6 downto 0);
Signal cnt :  integer :=0;
Signal clk_1Hz : std_logic;

Begin

process(clk)
Begin
if clk'event and clk = '1' then

    cnt <= cnt + 1;
    if cnt = 2500000 then
		clk_1Hz <= not clk_1Hz;
      cnt <= 1;
    end if;
end if;
End Process;

Process(clk_1Hz)
Begin

if clk_1Hz'event and clk_1Hz = '1' then
			
			--SEG1
			if INPUT1<9 then
				INPUT1 <= INPUT1 + '1';
			else
				INPUT1 <="0000";
				
				--SEG2
				if INPUT2<9 then
					INPUT2 <= INPUT2 + '1';
				
				else
					INPUT2 <= "0000";
					
					--SEG3
					if INPUT3<9 then
						INPUT3 <= INPUT3 + '1';
				
					else
						INPUT3 <= "0000";
						
						--SEG4
						if INPUT4<9 then
							INPUT4 <= INPUT4 + '1';
				
						else
							INPUT4 <= "0000";
							
						end if;
					end if;
				end if;
			end if;
	end if;

case (INPUT1) is
      when "0000" => sout1 <= "0000001";
      when "0001" => sout1 <= "1001111";
      when "0010" => sout1 <= "0010010";
      when "0011" => sout1 <= "0000110";
		when "0100" => sout1 <= "1001100";
      when "0101" => sout1 <= "0100100";
      when "0110" => sout1 <= "0100000";
      when "0111" => sout1 <= "0001111";
      when "1000" => sout1 <= "0000000";
      when "1001" => sout1 <= "0000100";
		when others => null;
end case;
case (INPUT2) is
      when "0000" => sout2 <= "0000001";
      when "0001" => sout2 <= "1001111";
      when "0010" => sout2 <= "0010010";
      when "0011" => sout2 <= "0000110";
		when "0100" => sout2 <= "1001100";
      when "0101" => sout2 <= "0100100";
      when "0110" => sout2 <= "0100000";
      when "0111" => sout2 <= "0001111";
      when "1000" => sout2 <= "0000000";
      when "1001" => sout2 <= "0000100";
		when others => null;
end case;
case (INPUT3) is
      when "0000" => sout3 <= "0000001";
      when "0001" => sout3 <= "1001111";
      when "0010" => sout3 <= "0010010";
      when "0011" => sout3 <= "0000110";
		when "0100" => sout3 <= "1001100";
      when "0101" => sout3 <= "0100100";
      when "0110" => sout3 <= "0100000";
      when "0111" => sout3 <= "0001111";
      when "1000" => sout3 <= "0000000";
      when "1001" => sout3 <= "0000100";
		when others => null;
end case;
case (INPUT4) is
      when "0000" => sout4 <= "0000001";
      when "0001" => sout4 <= "1001111";
      when "0010" => sout4 <= "0010010";
      when "0011" => sout4 <= "0000110";
		when "0100" => sout4 <= "1001100";
      when "0101" => sout4 <= "0100100";
      when "0110" => sout4 <= "0100000";
      when "0111" => sout4 <= "0001111";
      when "1000" => sout4 <= "0000000";
      when "1001" => sout4 <= "0000100";
		when others => null;
end case;
End Process;
SEG1 <= sout1;
SEG2 <= sout2;
SEG3 <= sout3;
SEG4 <= sout4;
End Behavioral;