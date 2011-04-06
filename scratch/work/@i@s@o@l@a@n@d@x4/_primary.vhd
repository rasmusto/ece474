library verilog;
use verilog.vl_types.all;
entity ISOLANDX4 is
    port(
        ISO             : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end ISOLANDX4;
