library verilog;
use verilog.vl_types.all;
entity DEC24X1 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        Q0              : out    vl_logic;
        Q1              : out    vl_logic;
        Q2              : out    vl_logic;
        Q3              : out    vl_logic
    );
end DEC24X1;
