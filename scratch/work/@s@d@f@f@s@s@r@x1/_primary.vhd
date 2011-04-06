library verilog;
use verilog.vl_types.all;
entity SDFFSSRX1 is
    port(
        CLK             : in     vl_logic;
        D               : in     vl_logic;
        RSTB            : in     vl_logic;
        SETB            : in     vl_logic;
        SI              : in     vl_logic;
        SE              : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic
    );
end SDFFSSRX1;
