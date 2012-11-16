library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.all;

entity slice is port(
   clk       : in  std_logic;
   input     : in  std_logic_vector(2 downto 0) := "000";
   out_0_cfg : in  std_logic_vector(7 downto 0) := "00000000";
   out_1_cfg : in  std_logic_vector(7 downto 0) := "00000000";
   async_0   : in  std_logic;
   async_1   : in  std_logic;
   out_0     : out std_logic;
   out_1     : out std_logic
   );
end slice;

architecture behavior of slice is

   begin

   process(clk,input,out_0_cfg,out_1_cfg) is
      begin
      out_0 <= out_0_cfg(to_integer(unsigned(input)));
      out_1 <= out_1_cfg(to_integer(unsigned(input)));
   end process;

end behavior;