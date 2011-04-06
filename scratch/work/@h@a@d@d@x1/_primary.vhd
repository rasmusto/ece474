library verilog;
use verilog.vl_types.all;
entity HADDX1 is
    port(
        A0              : in     vl_logic;
        B0              : in     vl_logic;
        SO              : out    vl_logic;
        C1              : out    vl_logic
    );
end HADDX1;
