library verilog;
use verilog.vl_types.all;
entity MUX41X1 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        IN3             : in     vl_logic;
        IN4             : in     vl_logic;
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        Q               : out    vl_logic
    );
end MUX41X1;
