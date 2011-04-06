library verilog;
use verilog.vl_types.all;
entity DFFNASRQX2 is
    port(
        D               : in     vl_logic;
        CLK             : in     vl_logic;
        RSTB            : in     vl_logic;
        SETB            : in     vl_logic;
        Q               : out    vl_logic
    );
end DFFNASRQX2;
