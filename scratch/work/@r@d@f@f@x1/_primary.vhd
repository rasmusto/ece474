library verilog;
use verilog.vl_types.all;
entity RDFFX1 is
    port(
        D               : in     vl_logic;
        CLK             : in     vl_logic;
        RETN            : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end RDFFX1;
