library verilog;
use verilog.vl_types.all;
entity NOR2X0 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        QN              : out    vl_logic
    );
end NOR2X0;
