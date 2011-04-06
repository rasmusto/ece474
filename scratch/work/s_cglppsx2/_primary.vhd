library verilog;
use verilog.vl_types.all;
entity s_cglppsx2 is
    port(
        SE              : in     vl_logic;
        EN              : in     vl_logic;
        CLK             : in     vl_logic;
        GCLK            : out    vl_logic;
        notifier        : in     vl_logic
    );
end s_cglppsx2;
