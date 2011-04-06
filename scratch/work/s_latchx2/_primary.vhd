library verilog;
use verilog.vl_types.all;
entity s_latchx2 is
    port(
        D               : in     vl_logic;
        CLK             : in     vl_logic;
        Q               : out    vl_logic;
        QN              : out    vl_logic;
        notifier        : in     vl_logic
    );
end s_latchx2;
