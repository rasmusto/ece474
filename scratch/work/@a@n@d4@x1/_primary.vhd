library verilog;
use verilog.vl_types.all;
entity AND4X1 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        IN3             : in     vl_logic;
        IN4             : in     vl_logic;
        Q               : out    vl_logic
    );
end AND4X1;
