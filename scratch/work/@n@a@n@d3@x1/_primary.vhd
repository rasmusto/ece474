library verilog;
use verilog.vl_types.all;
entity NAND3X1 is
    port(
        IN1             : in     vl_logic;
        IN2             : in     vl_logic;
        IN3             : in     vl_logic;
        QN              : out    vl_logic
    );
end NAND3X1;
