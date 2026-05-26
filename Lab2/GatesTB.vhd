library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity GATES_TB is
end entity GATES_TB;

architecture Simulation of GATES_TB is

    signal A, B : STD_LOGIC := '0';

    signal Y_AND, Y_OR : STD_LOGIC;
    signal Y_NAND, Y_NOR, Y_XOR, Y_XNOR : STD_LOGIC;
    signal Y_NOT : STD_LOGIC;

begin

    U1 : entity work.and_gate
        port map (A, B, Y_AND);

    U2 : entity work.or_gate
        port map (A, B, Y_OR);

    U3 : entity work.not_gate
        port map (A, Y_NOT);

    U4 : entity work.nand_gate
        port map (A, B, Y_NAND);

    U5 : entity work.nor_gate
        port map (A, B, Y_NOR);

    U6 : entity work.xor_gate
        port map (A, B, Y_XOR);

    U7 : entity work.xnor_gate
        port map (A, B, Y_XNOR);

    STIMULUS : process
    begin

        A <= '0'; B <= '0';
        wait for 10 ns;

        A <= '0'; B <= '1';
        wait for 10 ns;

        A <= '1'; B <= '0';
        wait for 10 ns;

        A <= '1'; B <= '1';
        wait for 10 ns;

        wait;

    end process;

end architecture Simulation;