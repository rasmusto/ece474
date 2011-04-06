library verilog;
use verilog.vl_types.all;
entity AOI21X2 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        IN3             : in     vl_logic;
        QN              : out    vl_logic
    );
end AOI21X2;
