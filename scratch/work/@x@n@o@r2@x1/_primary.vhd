library verilog;
use verilog.vl_types.all;
entity XNOR2X1 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        Q               : out    vl_logic
    );
end XNOR2X1;
