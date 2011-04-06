library verilog;
use verilog.vl_types.all;
entity TNBUFFHX32 is
    port(
        \IN\            : in     vl_logic;
        ENB             : in     vl_logic;
        Q               : out    vl_logic
    );
end TNBUFFHX32;
