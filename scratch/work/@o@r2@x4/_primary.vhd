library verilog;
use verilog.vl_types.all;
entity OR2X4 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        Q               : out    vl_logic
    );
end OR2X4;
