library verilog;
use verilog.vl_types.all;
entity adder8 is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        cin             : in     vl_logic_vector(7 downto 0);
        sum_out         : out    vl_logic_vector(7 downto 0);
        c_out           : out    vl_logic
    );
end adder8;
