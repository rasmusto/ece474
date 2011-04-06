library verilog;
use verilog.vl_types.all;
entity XOR2X1 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        Q               : out    vl_logic
    );
end XOR2X1;
