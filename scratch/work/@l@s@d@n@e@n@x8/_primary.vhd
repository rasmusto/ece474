library verilog;
use verilog.vl_types.all;
entity LSDNENX8 is
    port(
        ENB             : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end LSDNENX8;
