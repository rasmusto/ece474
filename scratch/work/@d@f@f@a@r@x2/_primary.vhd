library verilog;
use verilog.vl_types.all;
entity DFFARX2 is
    port(
        D               : in     vl_logic;
        CLK             : in     vl_logic;
        RSTB            : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end DFFARX2;
