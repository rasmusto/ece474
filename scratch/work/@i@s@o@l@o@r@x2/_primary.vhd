library verilog;
use verilog.vl_types.all;
entity ISOLORX2 is
    port(
        ISO             : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end ISOLORX2;
