library verilog;
use verilog.vl_types.all;
entity ISOLANDX1 is
    port(
        ISO             : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end ISOLANDX1;
