library verilog;
use verilog.vl_types.all;
entity AND2X2 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        Q               : out    vl_logic
    );
end AND2X2;
