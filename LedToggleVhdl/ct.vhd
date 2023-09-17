library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter is
    generic (
        N         : natural := 5;
        c_clkfreq : natural := 12_000_000
    );
    port (
        clk     : in  std_logic;
        count_o : out std_logic_vector(N-1 downto 0)
    );
end entity counter;

architecture Behavioral of counter is
    signal timer : unsigned(24 downto 0) := (others => '0');
    signal led     :std_logic;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if timer = unsigned(to_unsigned(c_clkfreq-1, timer'length)) then
                timer <= (others => '0');
                led<= not led;
            else
                timer <= timer + 1;
            end if;
        end if;
    end process;
    count_o(0)<= led;
end architecture Behavioral;
