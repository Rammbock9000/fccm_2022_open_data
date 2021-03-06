--------------------------------------------------------------------------------
--                         ModuloCounter_8_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Patrick Sittel
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity ModuloCounter_8_component is
   port ( clk, rst : in std_logic;
          Counter_out : out std_logic_vector(2 downto 0)   );
end entity;

architecture arch of ModuloCounter_8_component is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk,rst)
	 variable count : std_logic_vector(2 downto 0) := (others => '0');
begin
	 if rst = '1' then
	 	 count := (others => '0');
	 elsif clk'event and clk = '1' then
	 	 if count = 7 then
	 	 	 count := (others => '0');
	 	 else
	 	 	 count := count+1;
	 	 end if;
	 end if;
	 Counter_out <= count;
end process;
end architecture;

--------------------------------------------------------------------------------
--                          InputIEEE_8_23_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2008)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity InputIEEE_8_23_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(31 downto 0);
          R : out std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of InputIEEE_8_23_component is
signal expX : std_logic_vector(7 downto 0) := (others => '0');
signal fracX : std_logic_vector(22 downto 0) := (others => '0');
signal sX : std_logic := '0';
signal expZero : std_logic := '0';
signal expInfty : std_logic := '0';
signal fracZero : std_logic := '0';
signal reprSubNormal : std_logic := '0';
signal sfracX : std_logic_vector(22 downto 0) := (others => '0');
signal fracR : std_logic_vector(22 downto 0) := (others => '0');
signal expR : std_logic_vector(7 downto 0) := (others => '0');
signal infinity : std_logic := '0';
signal zero : std_logic := '0';
signal NaN : std_logic := '0';
signal exnR : std_logic_vector(1 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   expX  <= X(30 downto 23);
   fracX  <= X(22 downto 0);
   sX  <= X(31);
   expZero  <= '1' when expX = (7 downto 0 => '0') else '0';
   expInfty  <= '1' when expX = (7 downto 0 => '1') else '0';
   fracZero <= '1' when fracX = (22 downto 0 => '0') else '0';
   reprSubNormal <= fracX(22);
   -- since we have one more exponent value than IEEE (field 0...0, value emin-1),
   -- we can represent subnormal numbers whose mantissa field begins with a 1
   sfracX <= fracX(21 downto 0) & '0' when (expZero='1' and reprSubNormal='1')    else fracX;
   fracR <= sfracX;
   -- copy exponent. This will be OK even for subnormals, zero and infty since in such cases the exn bits will prevail
   expR <= expX;
   infinity <= expInfty and fracZero;
   zero <= expZero and not reprSubNormal;
   NaN <= expInfty and not fracZero;
   exnR <= 
           "00" when zero='1' 
      else "10" when infinity='1' 
      else "11" when NaN='1' 
      else "01" ;  -- normal number
   R <= exnR & sX & expR & fracR; 
end architecture;

--------------------------------------------------------------------------------
--                   Constant_float_8_23_1_div_16_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Patrick Sittel
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Constant_float_8_23_1_div_16_component is
   port ( clk, rst : in std_logic;
          Y : out std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of Constant_float_8_23_1_div_16_component is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
---------------------  addFullComment for a large comment  ---------------------
   -- addComment for small left-aligned comment
    Y <= "0100111101100000000000000000000000";
end architecture;

--------------------------------------------------------------------------------
--                   Constant_float_8_23_n1_div_8_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Patrick Sittel
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Constant_float_8_23_n1_div_8_component is
   port ( clk, rst : in std_logic;
          Y : out std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of Constant_float_8_23_n1_div_8_component is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
---------------------  addFullComment for a large comment  ---------------------
   -- addComment for small left-aligned comment
    Y <= "0110111110000000000000000000000000";
end architecture;

--------------------------------------------------------------------------------
--                   Constant_float_8_23_1_div_4_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Patrick Sittel
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Constant_float_8_23_1_div_4_component is
   port ( clk, rst : in std_logic;
          Y : out std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of Constant_float_8_23_1_div_4_component is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
---------------------  addFullComment for a large comment  ---------------------
   -- addComment for small left-aligned comment
    Y <= "0100111110100000000000000000000000";
end architecture;

--------------------------------------------------------------------------------
--                   Constant_float_8_23_n1_div_2_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Patrick Sittel
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Constant_float_8_23_n1_div_2_component is
   port ( clk, rst : in std_logic;
          Y : out std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of Constant_float_8_23_n1_div_2_component is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
---------------------  addFullComment for a large comment  ---------------------
   -- addComment for small left-aligned comment
    Y <= "0110111111000000000000000000000000";
end architecture;

--------------------------------------------------------------------------------
--           IntMultiplier_UsingDSP_24_24_48_unsigned_F500_uid64193
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_UsingDSP_24_24_48_unsigned_F500_uid64193 is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(23 downto 0);
          Y : in std_logic_vector(23 downto 0);
          R : out std_logic_vector(47 downto 0)   );
end entity;

architecture arch of IntMultiplier_UsingDSP_24_24_48_unsigned_F500_uid64193 is
signal XX_m64194 : std_logic_vector(23 downto 0) := (others => '0');
signal YY_m64194 : std_logic_vector(23 downto 0) := (others => '0');
signal XX : unsigned(-1+24 downto 0) := (others => '0');
signal YY : unsigned(-1+24 downto 0) := (others => '0');
signal RR : unsigned(-1+48 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   XX_m64194 <= X ;
   YY_m64194 <= Y ;
   XX <= unsigned(X);
   YY <= unsigned(Y);
   RR <= XX*YY;
   R <= std_logic_vector(RR(47 downto 0));
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_33_f500_uid64197
--                    (IntAdderClassical_33_f500_uid64199)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_33_f500_uid64197 is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(32 downto 0);
          Y : in std_logic_vector(32 downto 0);
          Cin : in std_logic;
          R : out std_logic_vector(32 downto 0)   );
end entity;

architecture arch of IntAdder_33_f500_uid64197 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--         FPMultiplier_in_8_23_8_23_out_8_23_mult_X_mult_Y_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin 2008-2011
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPMultiplier_in_8_23_8_23_out_8_23_mult_X_mult_Y_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(8+23+2 downto 0);
          Y : in std_logic_vector(8+23+2 downto 0);
          R : out std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FPMultiplier_in_8_23_8_23_out_8_23_mult_X_mult_Y_component is
   component IntMultiplier_UsingDSP_24_24_48_unsigned_F500_uid64193 is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(23 downto 0);
             Y : in std_logic_vector(23 downto 0);
             R : out std_logic_vector(47 downto 0)   );
   end component;

   component IntAdder_33_f500_uid64197 is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(32 downto 0);
             Y : in std_logic_vector(32 downto 0);
             Cin : in std_logic;
             R : out std_logic_vector(32 downto 0)   );
   end component;

signal sign, sign_d1, sign_d2 : std_logic := '0';
signal expX : std_logic_vector(7 downto 0) := (others => '0');
signal expY : std_logic_vector(7 downto 0) := (others => '0');
signal expSumPreSub, expSumPreSub_d1 : std_logic_vector(9 downto 0) := (others => '0');
signal bias, bias_d1 : std_logic_vector(9 downto 0) := (others => '0');
signal expSum : std_logic_vector(9 downto 0) := (others => '0');
signal sigX : std_logic_vector(23 downto 0) := (others => '0');
signal sigY : std_logic_vector(23 downto 0) := (others => '0');
signal sigProd, sigProd_d1 : std_logic_vector(47 downto 0) := (others => '0');
signal excSel : std_logic_vector(3 downto 0) := (others => '0');
signal exc, exc_d1, exc_d2 : std_logic_vector(1 downto 0) := (others => '0');
signal norm : std_logic := '0';
signal expPostNorm : std_logic_vector(9 downto 0) := (others => '0');
signal sigProdExt, sigProdExt_d1 : std_logic_vector(47 downto 0) := (others => '0');
signal expSig, expSig_d1 : std_logic_vector(32 downto 0) := (others => '0');
signal sticky, sticky_d1 : std_logic := '0';
signal guard, guard_d1 : std_logic := '0';
signal round : std_logic := '0';
signal expSigPostRound : std_logic_vector(32 downto 0) := (others => '0');
signal excPostNorm : std_logic_vector(1 downto 0) := (others => '0');
signal finalExc : std_logic_vector(1 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            sign_d1 <=  sign;
            sign_d2 <=  sign_d1;
            expSumPreSub_d1 <=  expSumPreSub;
            bias_d1 <=  bias;
            sigProd_d1 <=  sigProd;
            exc_d1 <=  exc;
            exc_d2 <=  exc_d1;
            sigProdExt_d1 <=  sigProdExt;
            expSig_d1 <=  expSig;
            sticky_d1 <=  sticky;
            guard_d1 <=  guard;
         end if;
      end process;
   sign <= X(31) xor Y(31);
   expX <= X(30 downto 23);
   expY <= Y(30 downto 23);
   expSumPreSub <= ("00" & expX) + ("00" & expY);
   bias <= CONV_STD_LOGIC_VECTOR(127,10);
   ----------------Synchro barrier, entering cycle 1----------------
   expSum <= expSumPreSub_d1 - bias_d1;
   ----------------Synchro barrier, entering cycle 0----------------
   sigX <= "1" & X(22 downto 0);
   sigY <= "1" & Y(22 downto 0);
   SignificandMultiplication: IntMultiplier_UsingDSP_24_24_48_unsigned_F500_uid64193  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => sigProd,
                 X => sigX,
                 Y => sigY);
   ----------------Synchro barrier, entering cycle 0----------------
   excSel <= X(33 downto 32) & Y(33 downto 32);
   with excSel select 
   exc <= "00" when  "0000" | "0001" | "0100", 
          "01" when "0101",
          "10" when "0110" | "1001" | "1010" ,
          "11" when others;
   norm <= sigProd_d1(47);
   -- exponent update
   expPostNorm <= expSum + ("000000000" & norm);
   -- significand normalization shift
   sigProdExt <= sigProd_d1(46 downto 0) & "0" when norm='1' else
                         sigProd_d1(45 downto 0) & "00";
   expSig <= expPostNorm & sigProdExt(47 downto 25);
   sticky <= sigProdExt(24);
   guard <= '0' when sigProdExt(23 downto 0)="000000000000000000000000" else '1';
   ----------------Synchro barrier, entering cycle 2----------------
   round <= sticky_d1 and ( (guard_d1 and not(sigProdExt_d1(25))) or (sigProdExt_d1(25) ))  ;
      RoundingAdder: IntAdder_33_f500_uid64197  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => round,
                 R => expSigPostRound,
                 X => expSig_d1,
                 Y => "000000000000000000000000000000000");
   with expSigPostRound(32 downto 31) select
   excPostNorm <=  "01"  when  "00",
                               "10"             when "01", 
                               "00"             when "11"|"10",
                               "11"             when others;
   with exc_d2 select 
   finalExc <= exc_d2 when  "11"|"10"|"00",
                       excPostNorm when others; 
   R <= finalExc & sign_d2 & expSigPostRound(30 downto 0);
end architecture;

--------------------------------------------------------------------------------
--             Mux_sign_1_wordsize_34_numberOfInputs_8_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Mux_sign_1_wordsize_34_numberOfInputs_8_component is
   port ( clk, rst : in std_logic;
          iS_0 : in std_logic_vector(33 downto 0);
          iS_1 : in std_logic_vector(33 downto 0);
          iS_2 : in std_logic_vector(33 downto 0);
          iS_3 : in std_logic_vector(33 downto 0);
          iS_4 : in std_logic_vector(33 downto 0);
          iS_5 : in std_logic_vector(33 downto 0);
          iS_6 : in std_logic_vector(33 downto 0);
          iS_7 : in std_logic_vector(33 downto 0);
          iSel : in std_logic_vector(2 downto 0);
          oMux : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Mux_sign_1_wordsize_34_numberOfInputs_8_component is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   with iSel select
      oMux <= 
         iS_0 when "000",
         iS_1 when "001",
         iS_2 when "010",
         iS_3 when "011",
         iS_4 when "100",
         iS_5 when "101",
         iS_6 when "110",
         iS_7 when "111",
(others=>'X') when others;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      Y <= s0;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--             Mux_sign_1_wordsize_34_numberOfInputs_7_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Mux_sign_1_wordsize_34_numberOfInputs_7_component is
   port ( clk, rst : in std_logic;
          iS_0 : in std_logic_vector(33 downto 0);
          iS_1 : in std_logic_vector(33 downto 0);
          iS_2 : in std_logic_vector(33 downto 0);
          iS_3 : in std_logic_vector(33 downto 0);
          iS_4 : in std_logic_vector(33 downto 0);
          iS_5 : in std_logic_vector(33 downto 0);
          iS_6 : in std_logic_vector(33 downto 0);
          iSel : in std_logic_vector(2 downto 0);
          oMux : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Mux_sign_1_wordsize_34_numberOfInputs_7_component is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   with iSel select
      oMux <= 
         iS_0 when "000",
         iS_1 when "001",
         iS_2 when "010",
         iS_3 when "011",
         iS_4 when "100",
         iS_5 when "101",
         iS_6 when "110",
(others=>'X') when others;
end architecture;

--------------------------------------------------------------------------------
--             Mux_sign_1_wordsize_34_numberOfInputs_3_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Mux_sign_1_wordsize_34_numberOfInputs_3_component is
   port ( clk, rst : in std_logic;
          iS_0 : in std_logic_vector(33 downto 0);
          iS_1 : in std_logic_vector(33 downto 0);
          iS_2 : in std_logic_vector(33 downto 0);
          iSel : in std_logic_vector(1 downto 0);
          oMux : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Mux_sign_1_wordsize_34_numberOfInputs_3_component is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   with iSel select
      oMux <= 
         iS_0 when "00",
         iS_1 when "01",
         iS_2 when "10",
(others=>'X') when others;
end architecture;

--------------------------------------------------------------------------------
--                         OutputIEEE_8_23_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: F. Ferrandi  (2009-2012)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity OutputIEEE_8_23_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(8+23+2 downto 0);
          R : out std_logic_vector(31 downto 0)   );
end entity;

architecture arch of OutputIEEE_8_23_component is
signal expX : std_logic_vector(7 downto 0) := (others => '0');
signal fracX : std_logic_vector(22 downto 0) := (others => '0');
signal exnX : std_logic_vector(1 downto 0) := (others => '0');
signal sX : std_logic := '0';
signal expZero : std_logic := '0';
signal sfracX : std_logic_vector(22 downto 0) := (others => '0');
signal fracR : std_logic_vector(22 downto 0) := (others => '0');
signal expR : std_logic_vector(7 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   expX  <= X(30 downto 23);
   fracX  <= X(22 downto 0);
   exnX  <= X(33 downto 32);
   sX  <= X(31) when (exnX = "01" or exnX = "10" or exnX = "00") else '0';
   expZero  <= '1' when expX = (7 downto 0 => '0') else '0';
   -- since we have one more exponent value than IEEE (field 0...0, value emin-1),
   -- we can represent subnormal numbers whose mantissa field begins with a 1
   sfracX <= 
      (22 downto 0 => '0') when (exnX = "00") else
      '1' & fracX(22 downto 1) when (expZero = '1' and exnX = "01") else
      fracX when (exnX = "01") else 
      (22 downto 1 => '0') & exnX(0);
   fracR <= sfracX;
   expR <=  
      (7 downto 0 => '0') when (exnX = "00") else
      expX when (exnX = "01") else 
      (7 downto 0 => '1');
   R <= sX & expR & fracR; 
end architecture;

--------------------------------------------------------------------------------
--                      FPAdd_8_23_uid64314_RightShifter
--                 (RightShifter_24_by_max_26_F250_uid64316)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2011)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPAdd_8_23_uid64314_RightShifter is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(23 downto 0);
          S : in std_logic_vector(4 downto 0);
          R : out std_logic_vector(49 downto 0)   );
end entity;

architecture arch of FPAdd_8_23_uid64314_RightShifter is
signal level0 : std_logic_vector(23 downto 0) := (others => '0');
signal ps : std_logic_vector(4 downto 0) := (others => '0');
signal level1 : std_logic_vector(24 downto 0) := (others => '0');
signal level2 : std_logic_vector(26 downto 0) := (others => '0');
signal level3 : std_logic_vector(30 downto 0) := (others => '0');
signal level4 : std_logic_vector(38 downto 0) := (others => '0');
signal level5 : std_logic_vector(54 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   level0<= X;
   ps<= S;
   level1<=  (0 downto 0 => '0') & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   level2<=  (1 downto 0 => '0') & level1 when ps(1) = '1' else    level1 & (1 downto 0 => '0');
   level3<=  (3 downto 0 => '0') & level2 when ps(2) = '1' else    level2 & (3 downto 0 => '0');
   level4<=  (7 downto 0 => '0') & level3 when ps(3) = '1' else    level3 & (7 downto 0 => '0');
   level5<=  (15 downto 0 => '0') & level4 when ps(4) = '1' else    level4 & (15 downto 0 => '0');
   R <= level5(54 downto 5);
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_27_f250_uid64319
--                   (IntAdderAlternative_27_f250_uid64323)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_27_f250_uid64319 is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(26 downto 0);
          Y : in std_logic_vector(26 downto 0);
          Cin : in std_logic;
          R : out std_logic_vector(26 downto 0)   );
end entity;

architecture arch of IntAdder_27_f250_uid64319 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Alternative
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--               LZCShifter_28_to_28_counting_32_F250_uid64326
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Bogdan Pasca (2007)
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity LZCShifter_28_to_28_counting_32_F250_uid64326 is
   port ( clk, rst : in std_logic;
          I : in std_logic_vector(27 downto 0);
          Count : out std_logic_vector(4 downto 0);
          O : out std_logic_vector(27 downto 0)   );
end entity;

architecture arch of LZCShifter_28_to_28_counting_32_F250_uid64326 is
signal level5 : std_logic_vector(27 downto 0) := (others => '0');
signal count4, count4_d1 : std_logic := '0';
signal level4, level4_d1 : std_logic_vector(27 downto 0) := (others => '0');
signal count3, count3_d1 : std_logic := '0';
signal level3 : std_logic_vector(27 downto 0) := (others => '0');
signal count2 : std_logic := '0';
signal level2 : std_logic_vector(27 downto 0) := (others => '0');
signal count1 : std_logic := '0';
signal level1 : std_logic_vector(27 downto 0) := (others => '0');
signal count0 : std_logic := '0';
signal level0 : std_logic_vector(27 downto 0) := (others => '0');
signal sCount : std_logic_vector(4 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            count4_d1 <=  count4;
            level4_d1 <=  level4;
            count3_d1 <=  count3;
         end if;
      end process;
   level5 <= I ;
   count4<= '1' when level5(27 downto 12) = (27 downto 12=>'0') else '0';
   level4<= level5(27 downto 0) when count4='0' else level5(11 downto 0) & (15 downto 0 => '0');

   count3<= '1' when level4(27 downto 20) = (27 downto 20=>'0') else '0';
   ----------------Synchro barrier, entering cycle 1----------------
   level3<= level4_d1(27 downto 0) when count3_d1='0' else level4_d1(19 downto 0) & (7 downto 0 => '0');

   count2<= '1' when level3(27 downto 24) = (27 downto 24=>'0') else '0';
   level2<= level3(27 downto 0) when count2='0' else level3(23 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(27 downto 26) = (27 downto 26=>'0') else '0';
   level1<= level2(27 downto 0) when count1='0' else level2(25 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(27 downto 27) = (27 downto 27=>'0') else '0';
   level0<= level1(27 downto 0) when count0='0' else level1(26 downto 0) & (0 downto 0 => '0');

   O <= level0;
   sCount <= count4_d1 & count3_d1 & count2 & count1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                         IntAdder_34_f250_uid64329
--                    (IntAdderClassical_34_f250_uid64331)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_34_f250_uid64329 is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : in std_logic_vector(33 downto 0);
          Cin : in std_logic;
          R : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of IntAdder_34_f250_uid64329 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--                            FPAdd_8_23_uid64314
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity FPAdd_8_23_uid64314 is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(8+23+2 downto 0);
          Y : in std_logic_vector(8+23+2 downto 0);
          R : out std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FPAdd_8_23_uid64314 is
   component FPAdd_8_23_uid64314_RightShifter is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(23 downto 0);
             S : in std_logic_vector(4 downto 0);
             R : out std_logic_vector(49 downto 0)   );
   end component;

   component IntAdder_27_f250_uid64319 is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(26 downto 0);
             Y : in std_logic_vector(26 downto 0);
             Cin : in std_logic;
             R : out std_logic_vector(26 downto 0)   );
   end component;

   component LZCShifter_28_to_28_counting_32_F250_uid64326 is
      port ( clk, rst : in std_logic;
             I : in std_logic_vector(27 downto 0);
             Count : out std_logic_vector(4 downto 0);
             O : out std_logic_vector(27 downto 0)   );
   end component;

   component IntAdder_34_f250_uid64329 is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : in std_logic_vector(33 downto 0);
             Cin : in std_logic;
             R : out std_logic_vector(33 downto 0)   );
   end component;

signal excExpFracX : std_logic_vector(32 downto 0) := (others => '0');
signal excExpFracY : std_logic_vector(32 downto 0) := (others => '0');
signal eXmeY : std_logic_vector(8 downto 0) := (others => '0');
signal eYmeX : std_logic_vector(8 downto 0) := (others => '0');
signal swap : std_logic := '0';
signal newX, newX_d1 : std_logic_vector(33 downto 0) := (others => '0');
signal newY : std_logic_vector(33 downto 0) := (others => '0');
signal expX, expX_d1 : std_logic_vector(7 downto 0) := (others => '0');
signal excX : std_logic_vector(1 downto 0) := (others => '0');
signal excY : std_logic_vector(1 downto 0) := (others => '0');
signal signX : std_logic := '0';
signal signY : std_logic := '0';
signal EffSub, EffSub_d1, EffSub_d2, EffSub_d3 : std_logic := '0';
signal sXsYExnXY : std_logic_vector(5 downto 0) := (others => '0');
signal sdExnXY : std_logic_vector(3 downto 0) := (others => '0');
signal fracY : std_logic_vector(23 downto 0) := (others => '0');
signal excRt, excRt_d1, excRt_d2, excRt_d3 : std_logic_vector(1 downto 0) := (others => '0');
signal signR, signR_d1, signR_d2, signR_d3 : std_logic := '0';
signal expDiff : std_logic_vector(8 downto 0) := (others => '0');
signal shiftedOut : std_logic := '0';
signal shiftVal : std_logic_vector(4 downto 0) := (others => '0');
signal shiftedFracY, shiftedFracY_d1 : std_logic_vector(49 downto 0) := (others => '0');
signal sticky : std_logic := '0';
signal fracYfar : std_logic_vector(26 downto 0) := (others => '0');
signal EffSubVector : std_logic_vector(26 downto 0) := (others => '0');
signal fracYfarXorOp : std_logic_vector(26 downto 0) := (others => '0');
signal fracXfar : std_logic_vector(26 downto 0) := (others => '0');
signal cInAddFar : std_logic := '0';
signal fracAddResult : std_logic_vector(26 downto 0) := (others => '0');
signal fracGRS : std_logic_vector(27 downto 0) := (others => '0');
signal extendedExpInc, extendedExpInc_d1, extendedExpInc_d2 : std_logic_vector(9 downto 0) := (others => '0');
signal nZerosNew, nZerosNew_d1 : std_logic_vector(4 downto 0) := (others => '0');
signal shiftedFrac, shiftedFrac_d1 : std_logic_vector(27 downto 0) := (others => '0');
signal updatedExp : std_logic_vector(9 downto 0) := (others => '0');
signal eqdiffsign : std_logic := '0';
signal expFrac : std_logic_vector(33 downto 0) := (others => '0');
signal stk : std_logic := '0';
signal rnd : std_logic := '0';
signal grd : std_logic := '0';
signal lsb : std_logic := '0';
signal addToRoundBit, addToRoundBit_d1 : std_logic := '0';
signal RoundedExpFrac : std_logic_vector(33 downto 0) := (others => '0');
signal upExc : std_logic_vector(1 downto 0) := (others => '0');
signal fracR : std_logic_vector(22 downto 0) := (others => '0');
signal expR : std_logic_vector(7 downto 0) := (others => '0');
signal exExpExc : std_logic_vector(3 downto 0) := (others => '0');
signal excRt2 : std_logic_vector(1 downto 0) := (others => '0');
signal excR : std_logic_vector(1 downto 0) := (others => '0');
signal signR2 : std_logic := '0';
signal computedR : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            newX_d1 <=  newX;
            expX_d1 <=  expX;
            EffSub_d1 <=  EffSub;
            EffSub_d2 <=  EffSub_d1;
            EffSub_d3 <=  EffSub_d2;
            excRt_d1 <=  excRt;
            excRt_d2 <=  excRt_d1;
            excRt_d3 <=  excRt_d2;
            signR_d1 <=  signR;
            signR_d2 <=  signR_d1;
            signR_d3 <=  signR_d2;
            shiftedFracY_d1 <=  shiftedFracY;
            extendedExpInc_d1 <=  extendedExpInc;
            extendedExpInc_d2 <=  extendedExpInc_d1;
            nZerosNew_d1 <=  nZerosNew;
            shiftedFrac_d1 <=  shiftedFrac;
            addToRoundBit_d1 <=  addToRoundBit;
         end if;
      end process;
-- Exponent difference and swap  --
   excExpFracX <= X(33 downto 32) & X(30 downto 0);
   excExpFracY <= Y(33 downto 32) & Y(30 downto 0);
   eXmeY <= ("0" & X(30 downto 23)) - ("0" & Y(30 downto 23));
   eYmeX <= ("0" & Y(30 downto 23)) - ("0" & X(30 downto 23));
   swap <= '0' when excExpFracX >= excExpFracY else '1';
   newX <= X when swap = '0' else Y;
   newY <= Y when swap = '0' else X;
   expX<= newX(30 downto 23);
   excX<= newX(33 downto 32);
   excY<= newY(33 downto 32);
   signX<= newX(31);
   signY<= newY(31);
   EffSub <= signX xor signY;
   sXsYExnXY <= signX & signY & excX & excY;
   sdExnXY <= excX & excY;
   fracY <= "000000000000000000000000" when excY="00" else ('1' & newY(22 downto 0));
   with sXsYExnXY select 
   excRt <= "00" when "000000"|"010000"|"100000"|"110000",
      "01" when "000101"|"010101"|"100101"|"110101"|"000100"|"010100"|"100100"|"110100"|"000001"|"010001"|"100001"|"110001",
      "10" when "111010"|"001010"|"001000"|"011000"|"101000"|"111000"|"000010"|"010010"|"100010"|"110010"|"001001"|"011001"|"101001"|"111001"|"000110"|"010110"|"100110"|"110110", 
      "11" when others;
   signR<= '0' when (sXsYExnXY="100000" or sXsYExnXY="010000") else signX;
   ---------------- cycle 0----------------
   expDiff <= eXmeY when swap = '0' else eYmeX;
   shiftedOut <= '1' when (expDiff >= 25) else '0';
   shiftVal <= expDiff(4 downto 0) when shiftedOut='0' else CONV_STD_LOGIC_VECTOR(26,5) ;
   RightShifterComponent: FPAdd_8_23_uid64314_RightShifter  -- pipelineDepth=0 maxInDelay=2.25704e-09
      port map ( clk  => clk,
                 rst  => rst,
                 R => shiftedFracY,
                 S => shiftVal,
                 X => fracY);
   ----------------Synchro barrier, entering cycle 1----------------
   sticky <= '0' when (shiftedFracY_d1(23 downto 0)=CONV_STD_LOGIC_VECTOR(0,23)) else '1';
   ---------------- cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   fracYfar <= "0" & shiftedFracY_d1(49 downto 24);
   EffSubVector <= (26 downto 0 => EffSub_d1);
   fracYfarXorOp <= fracYfar xor EffSubVector;
   fracXfar <= "01" & (newX_d1(22 downto 0)) & "00";
   cInAddFar <= EffSub_d1 and not sticky;
   fracAdder: IntAdder_27_f250_uid64319  -- pipelineDepth=0 maxInDelay=1.02352e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => cInAddFar,
                 R => fracAddResult,
                 X => fracXfar,
                 Y => fracYfarXorOp);
   fracGRS<= fracAddResult & sticky; 
   extendedExpInc<= ("00" & expX_d1) + '1';
   LZC_component: LZCShifter_28_to_28_counting_32_F250_uid64326  -- pipelineDepth=1 maxInDelay=1.86552e-09
      port map ( clk  => clk,
                 rst  => rst,
                 Count => nZerosNew,
                 I => fracGRS,
                 O => shiftedFrac);
   ----------------Synchro barrier, entering cycle 2----------------
   ----------------Synchro barrier, entering cycle 3----------------
   updatedExp <= extendedExpInc_d2 - ("00000" & nZerosNew_d1);
   eqdiffsign <= '1' when nZerosNew_d1="11111" else '0';
   expFrac<= updatedExp & shiftedFrac_d1(26 downto 3);
   ---------------- cycle 2----------------
   stk<= shiftedFrac(1) or shiftedFrac(0);
   rnd<= shiftedFrac(2);
   grd<= shiftedFrac(3);
   lsb<= shiftedFrac(4);
   addToRoundBit<= '0' when (lsb='0' and grd='1' and rnd='0' and stk='0')  else '1';
   ----------------Synchro barrier, entering cycle 3----------------
   roundingAdder: IntAdder_34_f250_uid64329  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => addToRoundBit_d1,
                 R => RoundedExpFrac,
                 X => expFrac,
                 Y => "0000000000000000000000000000000000");
   ---------------- cycle 3----------------
   upExc <= RoundedExpFrac(33 downto 32);
   fracR <= RoundedExpFrac(23 downto 1);
   expR <= RoundedExpFrac(31 downto 24);
   exExpExc <= upExc & excRt_d3;
   with (exExpExc) select 
   excRt2<= "00" when "0000"|"0100"|"1000"|"1100"|"1001"|"1101",
      "01" when "0001",
      "10" when "0010"|"0110"|"1010"|"1110"|"0101",
      "11" when others;
   excR <= "00" when (eqdiffsign='1' and EffSub_d3='1') else excRt2;
   signR2 <= '0' when (eqdiffsign='1' and EffSub_d3='1') else signR_d3;
   computedR <= excR & signR2 & expR & fracR;
   R <= computedR;
end architecture;

--------------------------------------------------------------------------------
--         FPGenericAddSub_wE_8_wF_23_subX_false_subY_false_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity FPGenericAddSub_wE_8_wF_23_subX_false_subY_false_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(8+23+2 downto 0);
          Y : in std_logic_vector(8+23+2 downto 0);
          R : out std_logic_vector(8+23+2 downto 0)   );
end entity;

architecture arch of FPGenericAddSub_wE_8_wF_23_subX_false_subY_false_component is
   component FPAdd_8_23_uid64314 is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(8+23+2 downto 0);
             Y : in std_logic_vector(8+23+2 downto 0);
             R : out std_logic_vector(8+23+2 downto 0)   );
   end component;

signal X_out : std_logic_vector(33 downto 0) := (others => '0');
signal Y_out : std_logic_vector(33 downto 0) := (others => '0');
signal R_temp : std_logic_vector(8+23+2 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
X_out <= X;
Y_out <= Y;
   FPAddSubOp_instance: FPAdd_8_23_uid64314  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => R_temp,
                 X => X_out,
                 Y => Y_out);
   ----------------Synchro barrier, entering cycle 3----------------
R <= R_temp;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 3 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      Y <= s2;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 2 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      Y <= s1;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_6_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 6 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_6_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_6_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
signal s5 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
      s5 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      s5 <= s4;
      Y <= s5;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--          GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3 is
   port ( i0 : in std_logic;
          i1 : in std_logic;
          i2 : in std_logic;
          o0 : out std_logic;
          o1 : out std_logic;
          o2 : out std_logic   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3 is
signal t_in : std_logic_vector(2 downto 0) := (others => '0');
signal t_out : std_logic_vector(2 downto 0) := (others => '0');
begin
   t_in(0) <= i0;
   t_in(1) <= i1;
   t_in(2) <= i2;
   with t_in select t_out <= 
      "000" when "000",
      "001" when "001",
      "100" when "010",
      "110" when "011",
      "010" when "100",
      "011" when "101",
      "000" when "110",
      "101" when "111",
      "000" when others;

   o0 <= t_out(0);
   o1 <= t_out(1);
   o2 <= t_out(2);
end architecture;

--------------------------------------------------------------------------------
-- GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3_wrapper_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3_wrapper_component is
   port ( clk, rst : in std_logic;
          Input : in std_logic_vector(2 downto 0);
          Output : out std_logic_vector(2 downto 0)   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3_wrapper_component is
   component GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3 is
      port ( i0 : in std_logic;
             i1 : in std_logic;
             i2 : in std_logic;
             o0 : out std_logic;
             o1 : out std_logic;
             o2 : out std_logic   );
   end component;

signal Input0_out : std_logic := '0';
signal Input1_out : std_logic := '0';
signal Input2_out : std_logic := '0';
signal Output0_temp : std_logic := '0';
signal Output1_temp : std_logic := '0';
signal Output2_temp : std_logic := '0';
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
Input0_out <= Input(0);
Input1_out <= Input(1);
Input2_out <= Input(2);
   instLUT: GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3
      port map ( i0 => Input0_out,
                 i1 => Input1_out,
                 i2 => Input2_out,
                 o0 => Output0_temp,
                 o1 => Output1_temp,
                 o2 => Output2_temp);
   ----------------Synchro barrier, entering cycle 0----------------
Output(0) <= Output0_temp;
Output(1) <= Output1_temp;
Output(2) <= Output2_temp;

end architecture;

--------------------------------------------------------------------------------
--          GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3 is
   port ( i0 : in std_logic;
          i1 : in std_logic;
          i2 : in std_logic;
          o0 : out std_logic;
          o1 : out std_logic;
          o2 : out std_logic   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3 is
signal t_in : std_logic_vector(2 downto 0) := (others => '0');
signal t_out : std_logic_vector(2 downto 0) := (others => '0');
begin
   t_in(0) <= i0;
   t_in(1) <= i1;
   t_in(2) <= i2;
   with t_in select t_out <= 
      "000" when "000",
      "110" when "001",
      "100" when "010",
      "000" when "011",
      "001" when "100",
      "011" when "101",
      "010" when "110",
      "101" when "111",
      "000" when others;

   o0 <= t_out(0);
   o1 <= t_out(1);
   o2 <= t_out(2);
end architecture;

--------------------------------------------------------------------------------
-- GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3_wrapper_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3_wrapper_component is
   port ( clk, rst : in std_logic;
          Input : in std_logic_vector(2 downto 0);
          Output : out std_logic_vector(2 downto 0)   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3_wrapper_component is
   component GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3 is
      port ( i0 : in std_logic;
             i1 : in std_logic;
             i2 : in std_logic;
             o0 : out std_logic;
             o1 : out std_logic;
             o2 : out std_logic   );
   end component;

signal Input0_out : std_logic := '0';
signal Input1_out : std_logic := '0';
signal Input2_out : std_logic := '0';
signal Output0_temp : std_logic := '0';
signal Output1_temp : std_logic := '0';
signal Output2_temp : std_logic := '0';
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
Input0_out <= Input(0);
Input1_out <= Input(1);
Input2_out <= Input(2);
   instLUT: GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3
      port map ( i0 => Input0_out,
                 i1 => Input1_out,
                 i2 => Input2_out,
                 o0 => Output0_temp,
                 o1 => Output1_temp,
                 o2 => Output2_temp);
   ----------------Synchro barrier, entering cycle 0----------------
Output(0) <= Output0_temp;
Output(1) <= Output1_temp;
Output(2) <= Output2_temp;

end architecture;

--------------------------------------------------------------------------------
--         GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2 is
   port ( i0 : in std_logic;
          i1 : in std_logic;
          i2 : in std_logic;
          o0 : out std_logic;
          o1 : out std_logic   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2 is
signal t_in : std_logic_vector(2 downto 0) := (others => '0');
signal t_out : std_logic_vector(1 downto 0) := (others => '0');
begin
   t_in(0) <= i0;
   t_in(1) <= i1;
   t_in(2) <= i2;
   with t_in select t_out <= 
      "00" when "000",
      "01" when "001",
      "00" when "010",
      "00" when "011",
      "10" when "100",
      "00" when "101",
      "00" when "110",
      "00" when "111",
      "00" when others;

   o0 <= t_out(0);
   o1 <= t_out(1);
end architecture;

--------------------------------------------------------------------------------
--GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component is
   port ( clk, rst : in std_logic;
          Input : in std_logic_vector(2 downto 0);
          Output : out std_logic_vector(1 downto 0)   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component is
   component GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2 is
      port ( i0 : in std_logic;
             i1 : in std_logic;
             i2 : in std_logic;
             o0 : out std_logic;
             o1 : out std_logic   );
   end component;

signal Input0_out : std_logic := '0';
signal Input1_out : std_logic := '0';
signal Input2_out : std_logic := '0';
signal Output0_temp : std_logic := '0';
signal Output1_temp : std_logic := '0';
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
Input0_out <= Input(0);
Input1_out <= Input(1);
Input2_out <= Input(2);
   instLUT: GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2
      port map ( i0 => Input0_out,
                 i1 => Input1_out,
                 i2 => Input2_out,
                 o0 => Output0_temp,
                 o1 => Output1_temp);
   ----------------Synchro barrier, entering cycle 0----------------
Output(0) <= Output0_temp;
Output(1) <= Output1_temp;

end architecture;

--------------------------------------------------------------------------------
--         GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2 is
   port ( i0 : in std_logic;
          i1 : in std_logic;
          i2 : in std_logic;
          o0 : out std_logic;
          o1 : out std_logic   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2 is
signal t_in : std_logic_vector(2 downto 0) := (others => '0');
signal t_out : std_logic_vector(1 downto 0) := (others => '0');
begin
   t_in(0) <= i0;
   t_in(1) <= i1;
   t_in(2) <= i2;
   with t_in select t_out <= 
      "00" when "000",
      "00" when "001",
      "00" when "010",
      "00" when "011",
      "10" when "100",
      "00" when "101",
      "01" when "110",
      "00" when "111",
      "00" when others;

   o0 <= t_out(0);
   o1 <= t_out(1);
end architecture;

--------------------------------------------------------------------------------
--GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component is
   port ( clk, rst : in std_logic;
          Input : in std_logic_vector(2 downto 0);
          Output : out std_logic_vector(1 downto 0)   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component is
   component GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2 is
      port ( i0 : in std_logic;
             i1 : in std_logic;
             i2 : in std_logic;
             o0 : out std_logic;
             o1 : out std_logic   );
   end component;

signal Input0_out : std_logic := '0';
signal Input1_out : std_logic := '0';
signal Input2_out : std_logic := '0';
signal Output0_temp : std_logic := '0';
signal Output1_temp : std_logic := '0';
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
Input0_out <= Input(0);
Input1_out <= Input(1);
Input2_out <= Input(2);
   instLUT: GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2
      port map ( i0 => Input0_out,
                 i1 => Input1_out,
                 i2 => Input2_out,
                 o0 => Output0_temp,
                 o1 => Output1_temp);
   ----------------Synchro barrier, entering cycle 0----------------
Output(0) <= Output0_temp;
Output(1) <= Output1_temp;

end architecture;

--------------------------------------------------------------------------------
--         GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2 is
   port ( i0 : in std_logic;
          i1 : in std_logic;
          i2 : in std_logic;
          o0 : out std_logic;
          o1 : out std_logic   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2 is
signal t_in : std_logic_vector(2 downto 0) := (others => '0');
signal t_out : std_logic_vector(1 downto 0) := (others => '0');
begin
   t_in(0) <= i0;
   t_in(1) <= i1;
   t_in(2) <= i2;
   with t_in select t_out <= 
      "00" when "000",
      "01" when "001",
      "00" when "010",
      "00" when "011",
      "10" when "100",
      "00" when "101",
      "00" when "110",
      "00" when "111",
      "00" when others;

   o0 <= t_out(0);
   o1 <= t_out(1);
end architecture;

--------------------------------------------------------------------------------
--GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component is
   port ( clk, rst : in std_logic;
          Input : in std_logic_vector(2 downto 0);
          Output : out std_logic_vector(1 downto 0)   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component is
   component GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2 is
      port ( i0 : in std_logic;
             i1 : in std_logic;
             i2 : in std_logic;
             o0 : out std_logic;
             o1 : out std_logic   );
   end component;

signal Input0_out : std_logic := '0';
signal Input1_out : std_logic := '0';
signal Input2_out : std_logic := '0';
signal Output0_temp : std_logic := '0';
signal Output1_temp : std_logic := '0';
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
Input0_out <= Input(0);
Input1_out <= Input(1);
Input2_out <= Input(2);
   instLUT: GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2
      port map ( i0 => Input0_out,
                 i1 => Input1_out,
                 i2 => Input2_out,
                 o0 => Output0_temp,
                 o1 => Output1_temp);
   ----------------Synchro barrier, entering cycle 0----------------
Output(0) <= Output0_temp;
Output(1) <= Output1_temp;

end architecture;

--------------------------------------------------------------------------------
--         GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2 is
   port ( i0 : in std_logic;
          i1 : in std_logic;
          i2 : in std_logic;
          o0 : out std_logic;
          o1 : out std_logic   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2 is
signal t_in : std_logic_vector(2 downto 0) := (others => '0');
signal t_out : std_logic_vector(1 downto 0) := (others => '0');
begin
   t_in(0) <= i0;
   t_in(1) <= i1;
   t_in(2) <= i2;
   with t_in select t_out <= 
      "00" when "000",
      "10" when "001",
      "00" when "010",
      "00" when "011",
      "01" when "100",
      "00" when "101",
      "00" when "110",
      "00" when "111",
      "00" when others;

   o0 <= t_out(0);
   o1 <= t_out(1);
end architecture;

--------------------------------------------------------------------------------
--GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component is
   port ( clk, rst : in std_logic;
          Input : in std_logic_vector(2 downto 0);
          Output : out std_logic_vector(1 downto 0)   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component is
   component GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2 is
      port ( i0 : in std_logic;
             i1 : in std_logic;
             i2 : in std_logic;
             o0 : out std_logic;
             o1 : out std_logic   );
   end component;

signal Input0_out : std_logic := '0';
signal Input1_out : std_logic := '0';
signal Input2_out : std_logic := '0';
signal Output0_temp : std_logic := '0';
signal Output1_temp : std_logic := '0';
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
Input0_out <= Input(0);
Input1_out <= Input(1);
Input2_out <= Input(2);
   instLUT: GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2
      port map ( i0 => Input0_out,
                 i1 => Input1_out,
                 i2 => Input2_out,
                 o0 => Output0_temp,
                 o1 => Output1_temp);
   ----------------Synchro barrier, entering cycle 0----------------
Output(0) <= Output0_temp;
Output(1) <= Output1_temp;

end architecture;

--------------------------------------------------------------------------------
--         GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2 is
   port ( i0 : in std_logic;
          i1 : in std_logic;
          i2 : in std_logic;
          o0 : out std_logic;
          o1 : out std_logic   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2 is
signal t_in : std_logic_vector(2 downto 0) := (others => '0');
signal t_out : std_logic_vector(1 downto 0) := (others => '0');
begin
   t_in(0) <= i0;
   t_in(1) <= i1;
   t_in(2) <= i2;
   with t_in select t_out <= 
      "00" when "000",
      "10" when "001",
      "00" when "010",
      "00" when "011",
      "00" when "100",
      "00" when "101",
      "01" when "110",
      "00" when "111",
      "00" when others;

   o0 <= t_out(0);
   o1 <= t_out(1);
end architecture;

--------------------------------------------------------------------------------
--GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component is
   port ( clk, rst : in std_logic;
          Input : in std_logic_vector(2 downto 0);
          Output : out std_logic_vector(1 downto 0)   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component is
   component GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2 is
      port ( i0 : in std_logic;
             i1 : in std_logic;
             i2 : in std_logic;
             o0 : out std_logic;
             o1 : out std_logic   );
   end component;

signal Input0_out : std_logic := '0';
signal Input1_out : std_logic := '0';
signal Input2_out : std_logic := '0';
signal Output0_temp : std_logic := '0';
signal Output1_temp : std_logic := '0';
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
Input0_out <= Input(0);
Input1_out <= Input(1);
Input2_out <= Input(2);
   instLUT: GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2
      port map ( i0 => Input0_out,
                 i1 => Input1_out,
                 i2 => Input2_out,
                 o0 => Output0_temp,
                 o1 => Output1_temp);
   ----------------Synchro barrier, entering cycle 0----------------
Output(0) <= Output0_temp;
Output(1) <= Output1_temp;

end architecture;

--------------------------------------------------------------------------------
--         GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
-- >> University of Kassel, Germany
-- >> Digital Technology Group
-- >> Author(s):
-- >> Marco Kleinlein <kleinlein@uni-kassel.de>
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2 is
   port ( i0 : in std_logic;
          i1 : in std_logic;
          i2 : in std_logic;
          o0 : out std_logic;
          o1 : out std_logic   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2 is
signal t_in : std_logic_vector(2 downto 0) := (others => '0');
signal t_out : std_logic_vector(1 downto 0) := (others => '0');
begin
   t_in(0) <= i0;
   t_in(1) <= i1;
   t_in(2) <= i2;
   with t_in select t_out <= 
      "00" when "000",
      "10" when "001",
      "00" when "010",
      "00" when "011",
      "00" when "100",
      "00" when "101",
      "01" when "110",
      "00" when "111",
      "00" when others;

   o0 <= t_out(0);
   o1 <= t_out(1);
end architecture;

--------------------------------------------------------------------------------
--GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component is
   port ( clk, rst : in std_logic;
          Input : in std_logic_vector(2 downto 0);
          Output : out std_logic_vector(1 downto 0)   );
end entity;

architecture arch of GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component is
   component GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2 is
      port ( i0 : in std_logic;
             i1 : in std_logic;
             i2 : in std_logic;
             o0 : out std_logic;
             o1 : out std_logic   );
   end component;

signal Input0_out : std_logic := '0';
signal Input1_out : std_logic := '0';
signal Input2_out : std_logic := '0';
signal Output0_temp : std_logic := '0';
signal Output1_temp : std_logic := '0';
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
Input0_out <= Input(0);
Input1_out <= Input(1);
Input2_out <= Input(2);
   instLUT: GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2
      port map ( i0 => Input0_out,
                 i1 => Input1_out,
                 i2 => Input2_out,
                 o0 => Output0_temp,
                 o1 => Output1_temp);
   ----------------Synchro barrier, entering cycle 0----------------
Output(0) <= Output0_temp;
Output(1) <= Output1_temp;

end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_10_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 10 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_10_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_10_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
signal s5 : std_logic_vector(33 downto 0) := (others => '0');
signal s6 : std_logic_vector(33 downto 0) := (others => '0');
signal s7 : std_logic_vector(33 downto 0) := (others => '0');
signal s8 : std_logic_vector(33 downto 0) := (others => '0');
signal s9 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
      s5 <= "0000000000000000000000000000000000";
      s6 <= "0000000000000000000000000000000000";
      s7 <= "0000000000000000000000000000000000";
      s8 <= "0000000000000000000000000000000000";
      s9 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      s5 <= s4;
      s6 <= s5;
      s7 <= s6;
      s8 <= s7;
      s9 <= s8;
      Y <= s9;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_7_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 7 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_7_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_7_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
signal s5 : std_logic_vector(33 downto 0) := (others => '0');
signal s6 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
      s5 <= "0000000000000000000000000000000000";
      s6 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      s5 <= s4;
      s6 <= s5;
      Y <= s6;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_8_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 8 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_8_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_8_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
signal s5 : std_logic_vector(33 downto 0) := (others => '0');
signal s6 : std_logic_vector(33 downto 0) := (others => '0');
signal s7 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
      s5 <= "0000000000000000000000000000000000";
      s6 <= "0000000000000000000000000000000000";
      s7 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      s5 <= s4;
      s6 <= s5;
      s7 <= s6;
      Y <= s7;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_9_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 9 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_9_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_9_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
signal s5 : std_logic_vector(33 downto 0) := (others => '0');
signal s6 : std_logic_vector(33 downto 0) := (others => '0');
signal s7 : std_logic_vector(33 downto 0) := (others => '0');
signal s8 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
      s5 <= "0000000000000000000000000000000000";
      s6 <= "0000000000000000000000000000000000";
      s7 <= "0000000000000000000000000000000000";
      s8 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      s5 <= s4;
      s6 <= s5;
      s7 <= s6;
      s8 <= s7;
      Y <= s8;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_15_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 15 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_15_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_15_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
signal s5 : std_logic_vector(33 downto 0) := (others => '0');
signal s6 : std_logic_vector(33 downto 0) := (others => '0');
signal s7 : std_logic_vector(33 downto 0) := (others => '0');
signal s8 : std_logic_vector(33 downto 0) := (others => '0');
signal s9 : std_logic_vector(33 downto 0) := (others => '0');
signal s10 : std_logic_vector(33 downto 0) := (others => '0');
signal s11 : std_logic_vector(33 downto 0) := (others => '0');
signal s12 : std_logic_vector(33 downto 0) := (others => '0');
signal s13 : std_logic_vector(33 downto 0) := (others => '0');
signal s14 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
      s5 <= "0000000000000000000000000000000000";
      s6 <= "0000000000000000000000000000000000";
      s7 <= "0000000000000000000000000000000000";
      s8 <= "0000000000000000000000000000000000";
      s9 <= "0000000000000000000000000000000000";
      s10 <= "0000000000000000000000000000000000";
      s11 <= "0000000000000000000000000000000000";
      s12 <= "0000000000000000000000000000000000";
      s13 <= "0000000000000000000000000000000000";
      s14 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      s5 <= s4;
      s6 <= s5;
      s7 <= s6;
      s8 <= s7;
      s9 <= s8;
      s10 <= s9;
      s11 <= s10;
      s12 <= s11;
      s13 <= s12;
      s14 <= s13;
      Y <= s14;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_18_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 18 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_18_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_18_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
signal s5 : std_logic_vector(33 downto 0) := (others => '0');
signal s6 : std_logic_vector(33 downto 0) := (others => '0');
signal s7 : std_logic_vector(33 downto 0) := (others => '0');
signal s8 : std_logic_vector(33 downto 0) := (others => '0');
signal s9 : std_logic_vector(33 downto 0) := (others => '0');
signal s10 : std_logic_vector(33 downto 0) := (others => '0');
signal s11 : std_logic_vector(33 downto 0) := (others => '0');
signal s12 : std_logic_vector(33 downto 0) := (others => '0');
signal s13 : std_logic_vector(33 downto 0) := (others => '0');
signal s14 : std_logic_vector(33 downto 0) := (others => '0');
signal s15 : std_logic_vector(33 downto 0) := (others => '0');
signal s16 : std_logic_vector(33 downto 0) := (others => '0');
signal s17 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
      s5 <= "0000000000000000000000000000000000";
      s6 <= "0000000000000000000000000000000000";
      s7 <= "0000000000000000000000000000000000";
      s8 <= "0000000000000000000000000000000000";
      s9 <= "0000000000000000000000000000000000";
      s10 <= "0000000000000000000000000000000000";
      s11 <= "0000000000000000000000000000000000";
      s12 <= "0000000000000000000000000000000000";
      s13 <= "0000000000000000000000000000000000";
      s14 <= "0000000000000000000000000000000000";
      s15 <= "0000000000000000000000000000000000";
      s16 <= "0000000000000000000000000000000000";
      s17 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      s5 <= s4;
      s6 <= s5;
      s7 <= s6;
      s8 <= s7;
      s9 <= s8;
      s10 <= s9;
      s11 <= s10;
      s12 <= s11;
      s13 <= s12;
      s14 <= s13;
      s15 <= s14;
      s16 <= s15;
      s17 <= s16;
      Y <= s17;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_5_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 5 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_5_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_5_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      Y <= s4;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_25_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 25 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_25_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_25_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
signal s5 : std_logic_vector(33 downto 0) := (others => '0');
signal s6 : std_logic_vector(33 downto 0) := (others => '0');
signal s7 : std_logic_vector(33 downto 0) := (others => '0');
signal s8 : std_logic_vector(33 downto 0) := (others => '0');
signal s9 : std_logic_vector(33 downto 0) := (others => '0');
signal s10 : std_logic_vector(33 downto 0) := (others => '0');
signal s11 : std_logic_vector(33 downto 0) := (others => '0');
signal s12 : std_logic_vector(33 downto 0) := (others => '0');
signal s13 : std_logic_vector(33 downto 0) := (others => '0');
signal s14 : std_logic_vector(33 downto 0) := (others => '0');
signal s15 : std_logic_vector(33 downto 0) := (others => '0');
signal s16 : std_logic_vector(33 downto 0) := (others => '0');
signal s17 : std_logic_vector(33 downto 0) := (others => '0');
signal s18 : std_logic_vector(33 downto 0) := (others => '0');
signal s19 : std_logic_vector(33 downto 0) := (others => '0');
signal s20 : std_logic_vector(33 downto 0) := (others => '0');
signal s21 : std_logic_vector(33 downto 0) := (others => '0');
signal s22 : std_logic_vector(33 downto 0) := (others => '0');
signal s23 : std_logic_vector(33 downto 0) := (others => '0');
signal s24 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
      s5 <= "0000000000000000000000000000000000";
      s6 <= "0000000000000000000000000000000000";
      s7 <= "0000000000000000000000000000000000";
      s8 <= "0000000000000000000000000000000000";
      s9 <= "0000000000000000000000000000000000";
      s10 <= "0000000000000000000000000000000000";
      s11 <= "0000000000000000000000000000000000";
      s12 <= "0000000000000000000000000000000000";
      s13 <= "0000000000000000000000000000000000";
      s14 <= "0000000000000000000000000000000000";
      s15 <= "0000000000000000000000000000000000";
      s16 <= "0000000000000000000000000000000000";
      s17 <= "0000000000000000000000000000000000";
      s18 <= "0000000000000000000000000000000000";
      s19 <= "0000000000000000000000000000000000";
      s20 <= "0000000000000000000000000000000000";
      s21 <= "0000000000000000000000000000000000";
      s22 <= "0000000000000000000000000000000000";
      s23 <= "0000000000000000000000000000000000";
      s24 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      s5 <= s4;
      s6 <= s5;
      s7 <= s6;
      s8 <= s7;
      s9 <= s8;
      s10 <= s9;
      s11 <= s10;
      s12 <= s11;
      s13 <= s12;
      s14 <= s13;
      s15 <= s14;
      s16 <= s15;
      s17 <= s16;
      s18 <= s17;
      s19 <= s18;
      s20 <= s19;
      s21 <= s20;
      s22 <= s21;
      s23 <= s22;
      s24 <= s23;
      Y <= s24;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--Delay_34_DelayLength_24_initialCondition_0000000000000000000000000000000000_component
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Nigel Kretschmer
--------------------------------------------------------------------------------
-- Pipeline depth: 24 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity Delay_34_DelayLength_24_initialCondition_0000000000000000000000000000000000_component is
   port ( clk, rst : in std_logic;
          X : in std_logic_vector(33 downto 0);
          Y : out std_logic_vector(33 downto 0)   );
end entity;

architecture arch of Delay_34_DelayLength_24_initialCondition_0000000000000000000000000000000000_component is
signal s0 : std_logic_vector(33 downto 0) := (others => '0');
signal s1 : std_logic_vector(33 downto 0) := (others => '0');
signal s2 : std_logic_vector(33 downto 0) := (others => '0');
signal s3 : std_logic_vector(33 downto 0) := (others => '0');
signal s4 : std_logic_vector(33 downto 0) := (others => '0');
signal s5 : std_logic_vector(33 downto 0) := (others => '0');
signal s6 : std_logic_vector(33 downto 0) := (others => '0');
signal s7 : std_logic_vector(33 downto 0) := (others => '0');
signal s8 : std_logic_vector(33 downto 0) := (others => '0');
signal s9 : std_logic_vector(33 downto 0) := (others => '0');
signal s10 : std_logic_vector(33 downto 0) := (others => '0');
signal s11 : std_logic_vector(33 downto 0) := (others => '0');
signal s12 : std_logic_vector(33 downto 0) := (others => '0');
signal s13 : std_logic_vector(33 downto 0) := (others => '0');
signal s14 : std_logic_vector(33 downto 0) := (others => '0');
signal s15 : std_logic_vector(33 downto 0) := (others => '0');
signal s16 : std_logic_vector(33 downto 0) := (others => '0');
signal s17 : std_logic_vector(33 downto 0) := (others => '0');
signal s18 : std_logic_vector(33 downto 0) := (others => '0');
signal s19 : std_logic_vector(33 downto 0) := (others => '0');
signal s20 : std_logic_vector(33 downto 0) := (others => '0');
signal s21 : std_logic_vector(33 downto 0) := (others => '0');
signal s22 : std_logic_vector(33 downto 0) := (others => '0');
signal s23 : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
process(clk, rst, X)
begin
   if rst = '1' then
      Y <= "0000000000000000000000000000000000";
      s1 <= "0000000000000000000000000000000000";
      s2 <= "0000000000000000000000000000000000";
      s3 <= "0000000000000000000000000000000000";
      s4 <= "0000000000000000000000000000000000";
      s5 <= "0000000000000000000000000000000000";
      s6 <= "0000000000000000000000000000000000";
      s7 <= "0000000000000000000000000000000000";
      s8 <= "0000000000000000000000000000000000";
      s9 <= "0000000000000000000000000000000000";
      s10 <= "0000000000000000000000000000000000";
      s11 <= "0000000000000000000000000000000000";
      s12 <= "0000000000000000000000000000000000";
      s13 <= "0000000000000000000000000000000000";
      s14 <= "0000000000000000000000000000000000";
      s15 <= "0000000000000000000000000000000000";
      s16 <= "0000000000000000000000000000000000";
      s17 <= "0000000000000000000000000000000000";
      s18 <= "0000000000000000000000000000000000";
      s19 <= "0000000000000000000000000000000000";
      s20 <= "0000000000000000000000000000000000";
      s21 <= "0000000000000000000000000000000000";
      s22 <= "0000000000000000000000000000000000";
      s23 <= "0000000000000000000000000000000000";
   elsif rising_edge(clk) then
      s1 <= s0;
      s2 <= s1;
      s3 <= s2;
      s4 <= s3;
      s5 <= s4;
      s6 <= s5;
      s7 <= s6;
      s8 <= s7;
      s9 <= s8;
      s10 <= s9;
      s11 <= s10;
      s12 <= s11;
      s13 <= s12;
      s14 <= s13;
      s15 <= s14;
      s16 <= s15;
      s17 <= s16;
      s18 <= s17;
      s19 <= s18;
      s20 <= s19;
      s21 <= s20;
      s22 <= s21;
      s23 <= s22;
      Y <= s23;
   end if;
   s0 <= X;
end process;
end architecture;

--------------------------------------------------------------------------------
--                         implementedSystem_toplevel
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity implementedSystem_toplevel is
   port ( clk, rst : in std_logic;
          In1_0 : in std_logic_vector(31 downto 0);
          In1_1 : in std_logic_vector(31 downto 0);
          In1_2 : in std_logic_vector(31 downto 0);
          Out1_0 : out std_logic_vector(31 downto 0);
          Out1_1 : out std_logic_vector(31 downto 0);
          Out1_2 : out std_logic_vector(31 downto 0)   );
end entity;

architecture arch of implementedSystem_toplevel is
   component ModuloCounter_8_component is
      port ( clk, rst : in std_logic;
             Counter_out : out std_logic_vector(2 downto 0)   );
   end component;

   component InputIEEE_8_23_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(31 downto 0);
             R : out std_logic_vector(8+23+2 downto 0)   );
   end component;

   component Constant_float_8_23_1_div_16_component is
      port ( clk, rst : in std_logic;
             Y : out std_logic_vector(8+23+2 downto 0)   );
   end component;

   component Constant_float_8_23_n1_div_8_component is
      port ( clk, rst : in std_logic;
             Y : out std_logic_vector(8+23+2 downto 0)   );
   end component;

   component Constant_float_8_23_1_div_4_component is
      port ( clk, rst : in std_logic;
             Y : out std_logic_vector(8+23+2 downto 0)   );
   end component;

   component Constant_float_8_23_n1_div_2_component is
      port ( clk, rst : in std_logic;
             Y : out std_logic_vector(8+23+2 downto 0)   );
   end component;

   component FPMultiplier_in_8_23_8_23_out_8_23_mult_X_mult_Y_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(8+23+2 downto 0);
             Y : in std_logic_vector(8+23+2 downto 0);
             R : out std_logic_vector(8+23+2 downto 0)   );
   end component;

   component Mux_sign_1_wordsize_34_numberOfInputs_8_component is
      port ( clk, rst : in std_logic;
             iS_0 : in std_logic_vector(33 downto 0);
             iS_1 : in std_logic_vector(33 downto 0);
             iS_2 : in std_logic_vector(33 downto 0);
             iS_3 : in std_logic_vector(33 downto 0);
             iS_4 : in std_logic_vector(33 downto 0);
             iS_5 : in std_logic_vector(33 downto 0);
             iS_6 : in std_logic_vector(33 downto 0);
             iS_7 : in std_logic_vector(33 downto 0);
             iSel : in std_logic_vector(2 downto 0);
             oMux : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Mux_sign_1_wordsize_34_numberOfInputs_7_component is
      port ( clk, rst : in std_logic;
             iS_0 : in std_logic_vector(33 downto 0);
             iS_1 : in std_logic_vector(33 downto 0);
             iS_2 : in std_logic_vector(33 downto 0);
             iS_3 : in std_logic_vector(33 downto 0);
             iS_4 : in std_logic_vector(33 downto 0);
             iS_5 : in std_logic_vector(33 downto 0);
             iS_6 : in std_logic_vector(33 downto 0);
             iSel : in std_logic_vector(2 downto 0);
             oMux : out std_logic_vector(33 downto 0)   );
   end component;

   component Mux_sign_1_wordsize_34_numberOfInputs_3_component is
      port ( clk, rst : in std_logic;
             iS_0 : in std_logic_vector(33 downto 0);
             iS_1 : in std_logic_vector(33 downto 0);
             iS_2 : in std_logic_vector(33 downto 0);
             iSel : in std_logic_vector(1 downto 0);
             oMux : out std_logic_vector(33 downto 0)   );
   end component;

   component OutputIEEE_8_23_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(8+23+2 downto 0);
             R : out std_logic_vector(31 downto 0)   );
   end component;

   component FPGenericAddSub_wE_8_wF_23_subX_false_subY_false_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(8+23+2 downto 0);
             Y : in std_logic_vector(8+23+2 downto 0);
             R : out std_logic_vector(8+23+2 downto 0)   );
   end component;

   component Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_6_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3_wrapper_component is
      port ( clk, rst : in std_logic;
             Input : in std_logic_vector(2 downto 0);
             Output : out std_logic_vector(2 downto 0)   );
   end component;

   component GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3_wrapper_component is
      port ( clk, rst : in std_logic;
             Input : in std_logic_vector(2 downto 0);
             Output : out std_logic_vector(2 downto 0)   );
   end component;

   component GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component is
      port ( clk, rst : in std_logic;
             Input : in std_logic_vector(2 downto 0);
             Output : out std_logic_vector(1 downto 0)   );
   end component;

   component GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component is
      port ( clk, rst : in std_logic;
             Input : in std_logic_vector(2 downto 0);
             Output : out std_logic_vector(1 downto 0)   );
   end component;

   component GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component is
      port ( clk, rst : in std_logic;
             Input : in std_logic_vector(2 downto 0);
             Output : out std_logic_vector(1 downto 0)   );
   end component;

   component GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component is
      port ( clk, rst : in std_logic;
             Input : in std_logic_vector(2 downto 0);
             Output : out std_logic_vector(1 downto 0)   );
   end component;

   component GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component is
      port ( clk, rst : in std_logic;
             Input : in std_logic_vector(2 downto 0);
             Output : out std_logic_vector(1 downto 0)   );
   end component;

   component GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component is
      port ( clk, rst : in std_logic;
             Input : in std_logic_vector(2 downto 0);
             Output : out std_logic_vector(1 downto 0)   );
   end component;

   component Delay_34_DelayLength_10_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_7_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_8_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_9_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_15_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_18_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_5_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_25_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

   component Delay_34_DelayLength_24_initialCondition_0000000000000000000000000000000000_component is
      port ( clk, rst : in std_logic;
             X : in std_logic_vector(33 downto 0);
             Y : out std_logic_vector(33 downto 0)   );
   end component;

signal ModCount81_out : std_logic_vector(2 downto 0) := (others => '0');
signal In1_0_out : std_logic_vector(33 downto 0) := (others => '0');
signal In1_1_out : std_logic_vector(33 downto 0) := (others => '0');
signal In1_2_out : std_logic_vector(33 downto 0) := (others => '0');
signal Const_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal Const1_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal Const2_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal Const3_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal Const4_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal Const5_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal Const6_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal Const7_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal Product_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product_0_impl_0_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product_0_impl_1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Product_2_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product_2_impl_0_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No2_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product_2_impl_1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No3_out : std_logic_vector(33 downto 0) := (others => '0');
signal Product1_2_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product1_2_impl_0_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No4_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product1_2_impl_1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No5_out : std_logic_vector(33 downto 0) := (others => '0');
signal Product2_2_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product2_2_impl_0_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No6_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product2_2_impl_1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No7_out : std_logic_vector(33 downto 0) := (others => '0');
signal Product4_2_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product4_2_impl_0_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No8_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product4_2_impl_1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No9_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No10_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No11_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No12_out : std_logic_vector(33 downto 0) := (others => '0');
signal SumTree0_0_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_SumTree0_0_impl_0_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No13_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_SumTree0_0_impl_1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No14_out : std_logic_vector(33 downto 0) := (others => '0');
signal SumTree0_1_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_SumTree0_1_impl_0_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No15_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_SumTree0_1_impl_1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No16_out : std_logic_vector(33 downto 0) := (others => '0');
signal SumTree0_2_impl_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_SumTree0_2_impl_0_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No17_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_SumTree0_2_impl_1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No18_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay31No_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay30No_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay31No1_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay31No5_out : std_logic_vector(33 downto 0) := (others => '0');
signal Delay31No7_out : std_logic_vector(33 downto 0) := (others => '0');
signal MUX_Product_2_impl_0_LUT_out : std_logic_vector(2 downto 0) := (others => '0');
signal MUX_Product_2_impl_1_LUT_out : std_logic_vector(2 downto 0) := (others => '0');
signal MUX_Product1_2_impl_0_LUT_out : std_logic_vector(1 downto 0) := (others => '0');
signal MUX_Product1_2_impl_1_LUT_out : std_logic_vector(1 downto 0) := (others => '0');
signal MUX_Product2_2_impl_0_LUT_out : std_logic_vector(1 downto 0) := (others => '0');
signal MUX_Product2_2_impl_1_LUT_out : std_logic_vector(1 downto 0) := (others => '0');
signal MUX_Product4_2_impl_0_LUT_out : std_logic_vector(1 downto 0) := (others => '0');
signal MUX_Product4_2_impl_1_LUT_out : std_logic_vector(1 downto 0) := (others => '0');
signal SharedReg_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg1_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg2_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg3_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg4_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg5_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg6_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg7_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg8_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg9_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg10_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg11_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg12_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg13_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg14_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg15_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg16_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg17_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg18_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg19_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg20_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg21_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg22_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg23_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg24_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg25_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg26_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg27_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg28_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg29_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg30_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg31_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg32_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg33_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg34_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg35_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg36_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg37_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg38_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg39_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg40_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg41_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg42_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg43_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg44_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg45_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg46_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg47_out : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg48_out : std_logic_vector(33 downto 0) := (others => '0');
signal In1_0_IEEE : std_logic_vector(31 downto 0) := (others => '0');
signal In1_1_IEEE : std_logic_vector(31 downto 0) := (others => '0');
signal In1_2_IEEE : std_logic_vector(31 downto 0) := (others => '0');
signal Delay1No_out_to_Product_0_impl_parent_implementedSystem_port_0_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No1_out_to_Product_0_impl_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg27_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg24_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg29_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg27_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg24_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg29_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg31_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg28_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_8_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg3_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg4_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg11_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg8_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg12_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg14_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg15_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_8_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No2_out_to_Product_2_impl_parent_implementedSystem_port_0_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No3_out_to_Product_2_impl_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg24_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg25_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg25_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg27_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg28_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg29_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg31_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg6_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg1_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg16_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg19_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg23_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg20_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg17_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No4_out_to_Product1_2_impl_parent_implementedSystem_port_0_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No5_out_to_Product1_2_impl_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg25_out_to_MUX_Product1_2_impl_0_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg26_out_to_MUX_Product1_2_impl_0_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg26_out_to_MUX_Product1_2_impl_0_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg10_out_to_MUX_Product1_2_impl_1_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg9_out_to_MUX_Product1_2_impl_1_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg18_out_to_MUX_Product1_2_impl_1_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No6_out_to_Product2_2_impl_parent_implementedSystem_port_0_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No7_out_to_Product2_2_impl_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg26_out_to_MUX_Product2_2_impl_0_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg30_out_to_MUX_Product2_2_impl_0_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg30_out_to_MUX_Product2_2_impl_0_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg2_out_to_MUX_Product2_2_impl_1_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg5_out_to_MUX_Product2_2_impl_1_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg21_out_to_MUX_Product2_2_impl_1_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No8_out_to_Product4_2_impl_parent_implementedSystem_port_0_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No9_out_to_Product4_2_impl_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg28_out_to_MUX_Product4_2_impl_0_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg30_out_to_MUX_Product4_2_impl_0_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg31_out_to_MUX_Product4_2_impl_0_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg7_out_to_MUX_Product4_2_impl_1_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg13_out_to_MUX_Product4_2_impl_1_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg22_out_to_MUX_Product4_2_impl_1_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Out1_0_IEEE : std_logic_vector(31 downto 0) := (others => '0');
signal Out1_1_IEEE : std_logic_vector(31 downto 0) := (others => '0');
signal Out1_2_IEEE : std_logic_vector(31 downto 0) := (others => '0');
signal Delay1No13_out_to_SumTree0_0_impl_parent_implementedSystem_port_0_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No14_out_to_SumTree0_0_impl_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg32_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_8_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay31No5_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg34_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg41_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg43_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay31No1_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg36_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg35_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg33_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_8_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No15_out_to_SumTree0_1_impl_parent_implementedSystem_port_0_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No16_out_to_SumTree0_1_impl_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg32_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_8_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg36_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg35_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg33_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg45_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg38_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg41_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg43_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay31No_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_8_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No17_out_to_SumTree0_2_impl_parent_implementedSystem_port_0_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay1No18_out_to_SumTree0_2_impl_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg36_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_8_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg45_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_1_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay30No_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_2_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg40_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_3_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg39_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_4_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg37_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_5_cast : std_logic_vector(33 downto 0) := (others => '0');
signal Delay31No7_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_6_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg44_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_7_cast : std_logic_vector(33 downto 0) := (others => '0');
signal SharedReg42_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_8_cast : std_logic_vector(33 downto 0) := (others => '0');
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   ModCount81_instance: ModuloCounter_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Counter_out => ModCount81_out);
In1_0_IEEE <= In1_0;
   In1_0_instance: InputIEEE_8_23_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => In1_0_out,
                 X => In1_0_IEEE);
In1_1_IEEE <= In1_1;
   In1_1_instance: InputIEEE_8_23_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => In1_1_out,
                 X => In1_1_IEEE);
In1_2_IEEE <= In1_2;
   In1_2_instance: InputIEEE_8_23_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => In1_2_out,
                 X => In1_2_IEEE);
   Const_0_impl_instance: Constant_float_8_23_1_div_16_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Y => Const_0_impl_out);
   Const1_0_impl_instance: Constant_float_8_23_n1_div_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Y => Const1_0_impl_out);
   Const2_0_impl_instance: Constant_float_8_23_1_div_4_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Y => Const2_0_impl_out);
   Const3_0_impl_instance: Constant_float_8_23_n1_div_2_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Y => Const3_0_impl_out);
   Const4_0_impl_instance: Constant_float_8_23_n1_div_2_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Y => Const4_0_impl_out);
   Const5_0_impl_instance: Constant_float_8_23_1_div_4_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Y => Const5_0_impl_out);
   Const6_0_impl_instance: Constant_float_8_23_n1_div_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Y => Const6_0_impl_out);
   Const7_0_impl_instance: Constant_float_8_23_1_div_16_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Y => Const7_0_impl_out);

Delay1No_out_to_Product_0_impl_parent_implementedSystem_port_0_cast <= Delay1No_out;
Delay1No1_out_to_Product_0_impl_parent_implementedSystem_port_1_cast <= Delay1No1_out;
   Product_0_impl_instance: FPMultiplier_in_8_23_8_23_out_8_23_mult_X_mult_Y_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Product_0_impl_out,
                 X => Delay1No_out_to_Product_0_impl_parent_implementedSystem_port_0_cast,
                 Y => Delay1No1_out_to_Product_0_impl_parent_implementedSystem_port_1_cast);

SharedReg27_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_1_cast <= SharedReg27_out;
SharedReg24_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_2_cast <= SharedReg24_out;
SharedReg29_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_3_cast <= SharedReg29_out;
SharedReg27_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_4_cast <= SharedReg27_out;
SharedReg24_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_5_cast <= SharedReg24_out;
SharedReg29_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_6_cast <= SharedReg29_out;
SharedReg31_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_7_cast <= SharedReg31_out;
SharedReg28_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_8_cast <= SharedReg28_out;
   MUX_Product_0_impl_0_instance: Mux_sign_1_wordsize_34_numberOfInputs_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg27_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg24_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg29_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg27_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_4_cast,
                 iS_4 => SharedReg24_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_5_cast,
                 iS_5 => SharedReg29_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg31_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_7_cast,
                 iS_7 => SharedReg28_out_to_MUX_Product_0_impl_0_parent_implementedSystem_port_8_cast,
                 iSel => ModCount81_out,
                 oMux => MUX_Product_0_impl_0_out);

   Delay1No_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product_0_impl_0_out,
                 Y => Delay1No_out);

SharedReg3_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_1_cast <= SharedReg3_out;
SharedReg_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_2_cast <= SharedReg_out;
SharedReg4_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_3_cast <= SharedReg4_out;
SharedReg11_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_4_cast <= SharedReg11_out;
SharedReg8_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_5_cast <= SharedReg8_out;
SharedReg12_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_6_cast <= SharedReg12_out;
SharedReg14_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_7_cast <= SharedReg14_out;
SharedReg15_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_8_cast <= SharedReg15_out;
   MUX_Product_0_impl_1_instance: Mux_sign_1_wordsize_34_numberOfInputs_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg3_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg4_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg11_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_4_cast,
                 iS_4 => SharedReg8_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_5_cast,
                 iS_5 => SharedReg12_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg14_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_7_cast,
                 iS_7 => SharedReg15_out_to_MUX_Product_0_impl_1_parent_implementedSystem_port_8_cast,
                 iSel => ModCount81_out,
                 oMux => MUX_Product_0_impl_1_out);

   Delay1No1_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product_0_impl_1_out,
                 Y => Delay1No1_out);

Delay1No2_out_to_Product_2_impl_parent_implementedSystem_port_0_cast <= Delay1No2_out;
Delay1No3_out_to_Product_2_impl_parent_implementedSystem_port_1_cast <= Delay1No3_out;
   Product_2_impl_instance: FPMultiplier_in_8_23_8_23_out_8_23_mult_X_mult_Y_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Product_2_impl_out,
                 X => Delay1No2_out_to_Product_2_impl_parent_implementedSystem_port_0_cast,
                 Y => Delay1No3_out_to_Product_2_impl_parent_implementedSystem_port_1_cast);

SharedReg24_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_1_cast <= SharedReg24_out;
SharedReg25_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_2_cast <= SharedReg25_out;
SharedReg25_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_3_cast <= SharedReg25_out;
SharedReg27_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_4_cast <= SharedReg27_out;
SharedReg28_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_5_cast <= SharedReg28_out;
SharedReg29_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_6_cast <= SharedReg29_out;
SharedReg31_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_7_cast <= SharedReg31_out;
   MUX_Product_2_impl_0_instance: Mux_sign_1_wordsize_34_numberOfInputs_7_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg24_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg25_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg25_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg27_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_4_cast,
                 iS_4 => SharedReg28_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_5_cast,
                 iS_5 => SharedReg29_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg31_out_to_MUX_Product_2_impl_0_parent_implementedSystem_port_7_cast,
                 iSel => MUX_Product_2_impl_0_LUT_out,
                 oMux => MUX_Product_2_impl_0_out);

   Delay1No2_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product_2_impl_0_out,
                 Y => Delay1No2_out);

SharedReg6_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_1_cast <= SharedReg6_out;
SharedReg1_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_2_cast <= SharedReg1_out;
SharedReg16_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_3_cast <= SharedReg16_out;
SharedReg19_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_4_cast <= SharedReg19_out;
SharedReg23_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_5_cast <= SharedReg23_out;
SharedReg20_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_6_cast <= SharedReg20_out;
SharedReg17_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_7_cast <= SharedReg17_out;
   MUX_Product_2_impl_1_instance: Mux_sign_1_wordsize_34_numberOfInputs_7_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg6_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg1_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg16_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg19_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_4_cast,
                 iS_4 => SharedReg23_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_5_cast,
                 iS_5 => SharedReg20_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg17_out_to_MUX_Product_2_impl_1_parent_implementedSystem_port_7_cast,
                 iSel => MUX_Product_2_impl_1_LUT_out,
                 oMux => MUX_Product_2_impl_1_out);

   Delay1No3_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product_2_impl_1_out,
                 Y => Delay1No3_out);

Delay1No4_out_to_Product1_2_impl_parent_implementedSystem_port_0_cast <= Delay1No4_out;
Delay1No5_out_to_Product1_2_impl_parent_implementedSystem_port_1_cast <= Delay1No5_out;
   Product1_2_impl_instance: FPMultiplier_in_8_23_8_23_out_8_23_mult_X_mult_Y_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Product1_2_impl_out,
                 X => Delay1No4_out_to_Product1_2_impl_parent_implementedSystem_port_0_cast,
                 Y => Delay1No5_out_to_Product1_2_impl_parent_implementedSystem_port_1_cast);

SharedReg25_out_to_MUX_Product1_2_impl_0_parent_implementedSystem_port_1_cast <= SharedReg25_out;
SharedReg26_out_to_MUX_Product1_2_impl_0_parent_implementedSystem_port_2_cast <= SharedReg26_out;
SharedReg26_out_to_MUX_Product1_2_impl_0_parent_implementedSystem_port_3_cast <= SharedReg26_out;
   MUX_Product1_2_impl_0_instance: Mux_sign_1_wordsize_34_numberOfInputs_3_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg25_out_to_MUX_Product1_2_impl_0_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg26_out_to_MUX_Product1_2_impl_0_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg26_out_to_MUX_Product1_2_impl_0_parent_implementedSystem_port_3_cast,
                 iSel => MUX_Product1_2_impl_0_LUT_out,
                 oMux => MUX_Product1_2_impl_0_out);

   Delay1No4_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product1_2_impl_0_out,
                 Y => Delay1No4_out);

SharedReg10_out_to_MUX_Product1_2_impl_1_parent_implementedSystem_port_1_cast <= SharedReg10_out;
SharedReg9_out_to_MUX_Product1_2_impl_1_parent_implementedSystem_port_2_cast <= SharedReg9_out;
SharedReg18_out_to_MUX_Product1_2_impl_1_parent_implementedSystem_port_3_cast <= SharedReg18_out;
   MUX_Product1_2_impl_1_instance: Mux_sign_1_wordsize_34_numberOfInputs_3_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg10_out_to_MUX_Product1_2_impl_1_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg9_out_to_MUX_Product1_2_impl_1_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg18_out_to_MUX_Product1_2_impl_1_parent_implementedSystem_port_3_cast,
                 iSel => MUX_Product1_2_impl_1_LUT_out,
                 oMux => MUX_Product1_2_impl_1_out);

   Delay1No5_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product1_2_impl_1_out,
                 Y => Delay1No5_out);

Delay1No6_out_to_Product2_2_impl_parent_implementedSystem_port_0_cast <= Delay1No6_out;
Delay1No7_out_to_Product2_2_impl_parent_implementedSystem_port_1_cast <= Delay1No7_out;
   Product2_2_impl_instance: FPMultiplier_in_8_23_8_23_out_8_23_mult_X_mult_Y_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Product2_2_impl_out,
                 X => Delay1No6_out_to_Product2_2_impl_parent_implementedSystem_port_0_cast,
                 Y => Delay1No7_out_to_Product2_2_impl_parent_implementedSystem_port_1_cast);

SharedReg26_out_to_MUX_Product2_2_impl_0_parent_implementedSystem_port_1_cast <= SharedReg26_out;
SharedReg30_out_to_MUX_Product2_2_impl_0_parent_implementedSystem_port_2_cast <= SharedReg30_out;
SharedReg30_out_to_MUX_Product2_2_impl_0_parent_implementedSystem_port_3_cast <= SharedReg30_out;
   MUX_Product2_2_impl_0_instance: Mux_sign_1_wordsize_34_numberOfInputs_3_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg26_out_to_MUX_Product2_2_impl_0_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg30_out_to_MUX_Product2_2_impl_0_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg30_out_to_MUX_Product2_2_impl_0_parent_implementedSystem_port_3_cast,
                 iSel => MUX_Product2_2_impl_0_LUT_out,
                 oMux => MUX_Product2_2_impl_0_out);

   Delay1No6_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product2_2_impl_0_out,
                 Y => Delay1No6_out);

SharedReg2_out_to_MUX_Product2_2_impl_1_parent_implementedSystem_port_1_cast <= SharedReg2_out;
SharedReg5_out_to_MUX_Product2_2_impl_1_parent_implementedSystem_port_2_cast <= SharedReg5_out;
SharedReg21_out_to_MUX_Product2_2_impl_1_parent_implementedSystem_port_3_cast <= SharedReg21_out;
   MUX_Product2_2_impl_1_instance: Mux_sign_1_wordsize_34_numberOfInputs_3_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg2_out_to_MUX_Product2_2_impl_1_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg5_out_to_MUX_Product2_2_impl_1_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg21_out_to_MUX_Product2_2_impl_1_parent_implementedSystem_port_3_cast,
                 iSel => MUX_Product2_2_impl_1_LUT_out,
                 oMux => MUX_Product2_2_impl_1_out);

   Delay1No7_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product2_2_impl_1_out,
                 Y => Delay1No7_out);

Delay1No8_out_to_Product4_2_impl_parent_implementedSystem_port_0_cast <= Delay1No8_out;
Delay1No9_out_to_Product4_2_impl_parent_implementedSystem_port_1_cast <= Delay1No9_out;
   Product4_2_impl_instance: FPMultiplier_in_8_23_8_23_out_8_23_mult_X_mult_Y_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Product4_2_impl_out,
                 X => Delay1No8_out_to_Product4_2_impl_parent_implementedSystem_port_0_cast,
                 Y => Delay1No9_out_to_Product4_2_impl_parent_implementedSystem_port_1_cast);

SharedReg28_out_to_MUX_Product4_2_impl_0_parent_implementedSystem_port_1_cast <= SharedReg28_out;
SharedReg30_out_to_MUX_Product4_2_impl_0_parent_implementedSystem_port_2_cast <= SharedReg30_out;
SharedReg31_out_to_MUX_Product4_2_impl_0_parent_implementedSystem_port_3_cast <= SharedReg31_out;
   MUX_Product4_2_impl_0_instance: Mux_sign_1_wordsize_34_numberOfInputs_3_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg28_out_to_MUX_Product4_2_impl_0_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg30_out_to_MUX_Product4_2_impl_0_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg31_out_to_MUX_Product4_2_impl_0_parent_implementedSystem_port_3_cast,
                 iSel => MUX_Product4_2_impl_0_LUT_out,
                 oMux => MUX_Product4_2_impl_0_out);

   Delay1No8_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product4_2_impl_0_out,
                 Y => Delay1No8_out);

SharedReg7_out_to_MUX_Product4_2_impl_1_parent_implementedSystem_port_1_cast <= SharedReg7_out;
SharedReg13_out_to_MUX_Product4_2_impl_1_parent_implementedSystem_port_2_cast <= SharedReg13_out;
SharedReg22_out_to_MUX_Product4_2_impl_1_parent_implementedSystem_port_3_cast <= SharedReg22_out;
   MUX_Product4_2_impl_1_instance: Mux_sign_1_wordsize_34_numberOfInputs_3_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg7_out_to_MUX_Product4_2_impl_1_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg13_out_to_MUX_Product4_2_impl_1_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg22_out_to_MUX_Product4_2_impl_1_parent_implementedSystem_port_3_cast,
                 iSel => MUX_Product4_2_impl_1_LUT_out,
                 oMux => MUX_Product4_2_impl_1_out);

   Delay1No9_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_Product4_2_impl_1_out,
                 Y => Delay1No9_out);
   Out1_0_instance: OutputIEEE_8_23_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Out1_0_IEEE,
                 X => Delay1No10_out);
Out1_0 <= Out1_0_IEEE;

   Delay1No10_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg46_out,
                 Y => Delay1No10_out);
   Out1_1_instance: OutputIEEE_8_23_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Out1_1_IEEE,
                 X => Delay1No11_out);
Out1_1 <= Out1_1_IEEE;

   Delay1No11_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg47_out,
                 Y => Delay1No11_out);
   Out1_2_instance: OutputIEEE_8_23_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => Out1_2_IEEE,
                 X => Delay1No12_out);
Out1_2 <= Out1_2_IEEE;

   Delay1No12_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg48_out,
                 Y => Delay1No12_out);

Delay1No13_out_to_SumTree0_0_impl_parent_implementedSystem_port_0_cast <= Delay1No13_out;
Delay1No14_out_to_SumTree0_0_impl_parent_implementedSystem_port_1_cast <= Delay1No14_out;
   SumTree0_0_impl_instance: FPGenericAddSub_wE_8_wF_23_subX_false_subY_false_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => SumTree0_0_impl_out,
                 X => Delay1No13_out_to_SumTree0_0_impl_parent_implementedSystem_port_0_cast,
                 Y => Delay1No14_out_to_SumTree0_0_impl_parent_implementedSystem_port_1_cast);

SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_1_cast <= SharedReg46_out;
SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_2_cast <= SharedReg46_out;
SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_3_cast <= SharedReg46_out;
SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_4_cast <= SharedReg46_out;
SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_5_cast <= SharedReg46_out;
SharedReg32_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_6_cast <= SharedReg32_out;
SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_7_cast <= SharedReg46_out;
SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_8_cast <= SharedReg46_out;
   MUX_SumTree0_0_impl_0_instance: Mux_sign_1_wordsize_34_numberOfInputs_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_4_cast,
                 iS_4 => SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_5_cast,
                 iS_5 => SharedReg32_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_7_cast,
                 iS_7 => SharedReg46_out_to_MUX_SumTree0_0_impl_0_parent_implementedSystem_port_8_cast,
                 iSel => ModCount81_out,
                 oMux => MUX_SumTree0_0_impl_0_out);

   Delay1No13_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_SumTree0_0_impl_0_out,
                 Y => Delay1No13_out);

Delay31No5_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_1_cast <= Delay31No5_out;
SharedReg34_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_2_cast <= SharedReg34_out;
SharedReg41_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_3_cast <= SharedReg41_out;
SharedReg43_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_4_cast <= SharedReg43_out;
Delay31No1_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_5_cast <= Delay31No1_out;
SharedReg36_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_6_cast <= SharedReg36_out;
SharedReg35_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_7_cast <= SharedReg35_out;
SharedReg33_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_8_cast <= SharedReg33_out;
   MUX_SumTree0_0_impl_1_instance: Mux_sign_1_wordsize_34_numberOfInputs_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => Delay31No5_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg34_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg41_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg43_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_4_cast,
                 iS_4 => Delay31No1_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_5_cast,
                 iS_5 => SharedReg36_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg35_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_7_cast,
                 iS_7 => SharedReg33_out_to_MUX_SumTree0_0_impl_1_parent_implementedSystem_port_8_cast,
                 iSel => ModCount81_out,
                 oMux => MUX_SumTree0_0_impl_1_out);

   Delay1No14_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_SumTree0_0_impl_1_out,
                 Y => Delay1No14_out);

Delay1No15_out_to_SumTree0_1_impl_parent_implementedSystem_port_0_cast <= Delay1No15_out;
Delay1No16_out_to_SumTree0_1_impl_parent_implementedSystem_port_1_cast <= Delay1No16_out;
   SumTree0_1_impl_instance: FPGenericAddSub_wE_8_wF_23_subX_false_subY_false_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => SumTree0_1_impl_out,
                 X => Delay1No15_out_to_SumTree0_1_impl_parent_implementedSystem_port_0_cast,
                 Y => Delay1No16_out_to_SumTree0_1_impl_parent_implementedSystem_port_1_cast);

SharedReg32_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_1_cast <= SharedReg32_out;
SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_2_cast <= SharedReg47_out;
SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_3_cast <= SharedReg47_out;
SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_4_cast <= SharedReg47_out;
SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_5_cast <= SharedReg47_out;
SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_6_cast <= SharedReg47_out;
SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_7_cast <= SharedReg47_out;
SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_8_cast <= SharedReg47_out;
   MUX_SumTree0_1_impl_0_instance: Mux_sign_1_wordsize_34_numberOfInputs_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg32_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_4_cast,
                 iS_4 => SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_5_cast,
                 iS_5 => SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_7_cast,
                 iS_7 => SharedReg47_out_to_MUX_SumTree0_1_impl_0_parent_implementedSystem_port_8_cast,
                 iSel => ModCount81_out,
                 oMux => MUX_SumTree0_1_impl_0_out);

   Delay1No15_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_SumTree0_1_impl_0_out,
                 Y => Delay1No15_out);

SharedReg36_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_1_cast <= SharedReg36_out;
SharedReg35_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_2_cast <= SharedReg35_out;
SharedReg33_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_3_cast <= SharedReg33_out;
SharedReg45_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_4_cast <= SharedReg45_out;
SharedReg38_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_5_cast <= SharedReg38_out;
SharedReg41_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_6_cast <= SharedReg41_out;
SharedReg43_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_7_cast <= SharedReg43_out;
Delay31No_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_8_cast <= Delay31No_out;
   MUX_SumTree0_1_impl_1_instance: Mux_sign_1_wordsize_34_numberOfInputs_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg36_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg35_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg33_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg45_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_4_cast,
                 iS_4 => SharedReg38_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_5_cast,
                 iS_5 => SharedReg41_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg43_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_7_cast,
                 iS_7 => Delay31No_out_to_MUX_SumTree0_1_impl_1_parent_implementedSystem_port_8_cast,
                 iSel => ModCount81_out,
                 oMux => MUX_SumTree0_1_impl_1_out);

   Delay1No16_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_SumTree0_1_impl_1_out,
                 Y => Delay1No16_out);

Delay1No17_out_to_SumTree0_2_impl_parent_implementedSystem_port_0_cast <= Delay1No17_out;
Delay1No18_out_to_SumTree0_2_impl_parent_implementedSystem_port_1_cast <= Delay1No18_out;
   SumTree0_2_impl_instance: FPGenericAddSub_wE_8_wF_23_subX_false_subY_false_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 R => SumTree0_2_impl_out,
                 X => Delay1No17_out_to_SumTree0_2_impl_parent_implementedSystem_port_0_cast,
                 Y => Delay1No18_out_to_SumTree0_2_impl_parent_implementedSystem_port_1_cast);

SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_1_cast <= SharedReg48_out;
SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_2_cast <= SharedReg48_out;
SharedReg36_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_3_cast <= SharedReg36_out;
SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_4_cast <= SharedReg48_out;
SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_5_cast <= SharedReg48_out;
SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_6_cast <= SharedReg48_out;
SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_7_cast <= SharedReg48_out;
SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_8_cast <= SharedReg48_out;
   MUX_SumTree0_2_impl_0_instance: Mux_sign_1_wordsize_34_numberOfInputs_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_1_cast,
                 iS_1 => SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg36_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_4_cast,
                 iS_4 => SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_5_cast,
                 iS_5 => SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_7_cast,
                 iS_7 => SharedReg48_out_to_MUX_SumTree0_2_impl_0_parent_implementedSystem_port_8_cast,
                 iSel => ModCount81_out,
                 oMux => MUX_SumTree0_2_impl_0_out);

   Delay1No17_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_SumTree0_2_impl_0_out,
                 Y => Delay1No17_out);

SharedReg45_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_1_cast <= SharedReg45_out;
Delay30No_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_2_cast <= Delay30No_out;
SharedReg40_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_3_cast <= SharedReg40_out;
SharedReg39_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_4_cast <= SharedReg39_out;
SharedReg37_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_5_cast <= SharedReg37_out;
Delay31No7_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_6_cast <= Delay31No7_out;
SharedReg44_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_7_cast <= SharedReg44_out;
SharedReg42_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_8_cast <= SharedReg42_out;
   MUX_SumTree0_2_impl_1_instance: Mux_sign_1_wordsize_34_numberOfInputs_8_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 iS_0 => SharedReg45_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_1_cast,
                 iS_1 => Delay30No_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_2_cast,
                 iS_2 => SharedReg40_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_3_cast,
                 iS_3 => SharedReg39_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_4_cast,
                 iS_4 => SharedReg37_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_5_cast,
                 iS_5 => Delay31No7_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_6_cast,
                 iS_6 => SharedReg44_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_7_cast,
                 iS_7 => SharedReg42_out_to_MUX_SumTree0_2_impl_1_parent_implementedSystem_port_8_cast,
                 iSel => ModCount81_out,
                 oMux => MUX_SumTree0_2_impl_1_out);

   Delay1No18_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => MUX_SumTree0_2_impl_1_out,
                 Y => Delay1No18_out);

   Delay31No_instance: Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg7_out,
                 Y => Delay31No_out);

   Delay30No_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg15_out,
                 Y => Delay30No_out);

   Delay31No1_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg23_out,
                 Y => Delay31No1_out);

   Delay31No5_instance: Delay_34_DelayLength_6_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=6 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg35_out,
                 Y => Delay31No5_out);

   Delay31No7_instance: Delay_34_DelayLength_6_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=6 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg39_out,
                 Y => Delay31No7_out);

   MUX_Product_2_impl_0_LUT_instance: GenericLut_LUTData_MUX_Product_2_impl_0_LUT_wIn_3_wOut_3_wrapper_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Input => ModCount81_out,
                 Output => MUX_Product_2_impl_0_LUT_out);

   MUX_Product_2_impl_1_LUT_instance: GenericLut_LUTData_MUX_Product_2_impl_1_LUT_wIn_3_wOut_3_wrapper_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Input => ModCount81_out,
                 Output => MUX_Product_2_impl_1_LUT_out);

   MUX_Product1_2_impl_0_LUT_instance: GenericLut_LUTData_MUX_Product1_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Input => ModCount81_out,
                 Output => MUX_Product1_2_impl_0_LUT_out);

   MUX_Product1_2_impl_1_LUT_instance: GenericLut_LUTData_MUX_Product1_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Input => ModCount81_out,
                 Output => MUX_Product1_2_impl_1_LUT_out);

   MUX_Product2_2_impl_0_LUT_instance: GenericLut_LUTData_MUX_Product2_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Input => ModCount81_out,
                 Output => MUX_Product2_2_impl_0_LUT_out);

   MUX_Product2_2_impl_1_LUT_instance: GenericLut_LUTData_MUX_Product2_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Input => ModCount81_out,
                 Output => MUX_Product2_2_impl_1_LUT_out);

   MUX_Product4_2_impl_0_LUT_instance: GenericLut_LUTData_MUX_Product4_2_impl_0_LUT_wIn_3_wOut_2_wrapper_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Input => ModCount81_out,
                 Output => MUX_Product4_2_impl_0_LUT_out);

   MUX_Product4_2_impl_1_LUT_instance: GenericLut_LUTData_MUX_Product4_2_impl_1_LUT_wIn_3_wOut_2_wrapper_component  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Input => ModCount81_out,
                 Output => MUX_Product4_2_impl_1_LUT_out);

   SharedReg_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => In1_0_out,
                 Y => SharedReg_out);

   SharedReg1_instance: Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg_out,
                 Y => SharedReg1_out);

   SharedReg2_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg1_out,
                 Y => SharedReg2_out);

   SharedReg3_instance: Delay_34_DelayLength_10_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=10 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg2_out,
                 Y => SharedReg3_out);

   SharedReg4_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg3_out,
                 Y => SharedReg4_out);

   SharedReg5_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg4_out,
                 Y => SharedReg5_out);

   SharedReg6_instance: Delay_34_DelayLength_7_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=7 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg5_out,
                 Y => SharedReg6_out);

   SharedReg7_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg6_out,
                 Y => SharedReg7_out);

   SharedReg8_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => In1_1_out,
                 Y => SharedReg8_out);

   SharedReg9_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg8_out,
                 Y => SharedReg9_out);

   SharedReg10_instance: Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg9_out,
                 Y => SharedReg10_out);

   SharedReg11_instance: Delay_34_DelayLength_10_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=10 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg10_out,
                 Y => SharedReg11_out);

   SharedReg12_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg11_out,
                 Y => SharedReg12_out);

   SharedReg13_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg12_out,
                 Y => SharedReg13_out);

   SharedReg14_instance: Delay_34_DelayLength_8_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=8 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg13_out,
                 Y => SharedReg14_out);

   SharedReg15_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg14_out,
                 Y => SharedReg15_out);

   SharedReg16_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => In1_2_out,
                 Y => SharedReg16_out);

   SharedReg17_instance: Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg16_out,
                 Y => SharedReg17_out);

   SharedReg18_instance: Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg17_out,
                 Y => SharedReg18_out);

   SharedReg19_instance: Delay_34_DelayLength_9_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=9 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg18_out,
                 Y => SharedReg19_out);

   SharedReg20_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg19_out,
                 Y => SharedReg20_out);

   SharedReg21_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg20_out,
                 Y => SharedReg21_out);

   SharedReg22_instance: Delay_34_DelayLength_8_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=8 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg21_out,
                 Y => SharedReg22_out);

   SharedReg23_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg22_out,
                 Y => SharedReg23_out);

   SharedReg24_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Const_0_impl_out,
                 Y => SharedReg24_out);

   SharedReg25_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Const1_0_impl_out,
                 Y => SharedReg25_out);

   SharedReg26_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Const2_0_impl_out,
                 Y => SharedReg26_out);

   SharedReg27_instance: Delay_34_DelayLength_8_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=8 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Const3_0_impl_out,
                 Y => SharedReg27_out);

   SharedReg28_instance: Delay_34_DelayLength_15_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=15 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Const4_0_impl_out,
                 Y => SharedReg28_out);

   SharedReg29_instance: Delay_34_DelayLength_2_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=2 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Const5_0_impl_out,
                 Y => SharedReg29_out);

   SharedReg30_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Const6_0_impl_out,
                 Y => SharedReg30_out);

   SharedReg31_instance: Delay_34_DelayLength_6_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=6 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Const7_0_impl_out,
                 Y => SharedReg31_out);

   SharedReg32_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Product_0_impl_out,
                 Y => SharedReg32_out);

   SharedReg33_instance: Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg32_out,
                 Y => SharedReg33_out);

   SharedReg34_instance: Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg33_out,
                 Y => SharedReg34_out);

   SharedReg35_instance: Delay_34_DelayLength_18_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=18 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg34_out,
                 Y => SharedReg35_out);

   SharedReg36_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Product_2_impl_out,
                 Y => SharedReg36_out);

   SharedReg37_instance: Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg36_out,
                 Y => SharedReg37_out);

   SharedReg38_instance: Delay_34_DelayLength_3_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=3 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg37_out,
                 Y => SharedReg38_out);

   SharedReg39_instance: Delay_34_DelayLength_18_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=18 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg38_out,
                 Y => SharedReg39_out);

   SharedReg40_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Product1_2_impl_out,
                 Y => SharedReg40_out);

   SharedReg41_instance: Delay_34_DelayLength_5_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=5 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg40_out,
                 Y => SharedReg41_out);

   SharedReg42_instance: Delay_34_DelayLength_6_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=6 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Product2_2_impl_out,
                 Y => SharedReg42_out);

   SharedReg43_instance: Delay_34_DelayLength_25_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=25 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg42_out,
                 Y => SharedReg43_out);

   SharedReg44_instance: Delay_34_DelayLength_7_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=7 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Product4_2_impl_out,
                 Y => SharedReg44_out);

   SharedReg45_instance: Delay_34_DelayLength_24_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=24 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SharedReg44_out,
                 Y => SharedReg45_out);

   SharedReg46_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SumTree0_0_impl_out,
                 Y => SharedReg46_out);

   SharedReg47_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SumTree0_1_impl_out,
                 Y => SharedReg47_out);

   SharedReg48_instance: Delay_34_DelayLength_1_initialCondition_0000000000000000000000000000000000_component  -- pipelineDepth=1 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => SumTree0_2_impl_out,
                 Y => SharedReg48_out);
end architecture;

