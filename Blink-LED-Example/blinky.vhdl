library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity blinky is
    Port ( 
        clk : in STD_LOGIC;   -- Input clock
        led : out STD_LOGIC   -- Output LED
    );
end blinky;

architecture Behavioral of blinky is
    signal counter : INTEGER range 0 to 13500000 := 0;
    signal led_state : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if counter = 13500000 then  -- Toggle LED every 0.5s (assuming 27MHz clock)
                led_state <= not led_state;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    led <= led_state;
end Behavioral;

