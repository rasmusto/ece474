library verilog;
use verilog.vl_types.all;
entity RSDFFX2 is
    port(
        D               : in     vl_logic;
        CLK             : in     vl_logic;
        RETN            : in     vl_logic;
        SE              : in     vl_logic;
        SI              : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end RSDFFX2;
