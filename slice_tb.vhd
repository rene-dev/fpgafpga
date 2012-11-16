library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;

entity slice_tb is
end slice_tb;

architecture behavior of slice_tb is 
   component slice
   port(
      clk       : in  std_logic;
      input     : in  std_logic_vector(2 downto 0) := "000";
      out_0_cfg : in  std_logic_vector(7 downto 0) := "00000000";
      out_1_cfg : in  std_logic_vector(7 downto 0) := "00000000";
      async_0   : in  std_logic;
      async_1   : in  std_logic;
      out_0     : out std_logic;
      out_1     : out std_logic
   );
   end component;

   signal clk      : std_logic := '0';
   signal input : std_logic_vector(2 downto 0) := "000";

   signal out_0 : std_logic;
   signal out_1 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

   begin

   uut: slice port map (
      clk => clk,
      input => input,
      out_0_cfg => "11101000",
      out_1_cfg => "10010110",
      async_0 => '0',
      async_1 => '0',
      out_0 => out_0,
      out_1 => out_1
   );

   clk_process: process
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;


   stim_proc: process
   begin	

   wait for 100 ns;
   input <= "000";
   wait for 100 ns;
   input <= "100";
   wait for 100 ns;
   input <= "010";
   wait for 100 ns;
   input <= "110";
	wait for clk_period*10;
   wait;
   end process;

end;
