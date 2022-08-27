library verilog;
use verilog.vl_types.all;
entity MUX_4to1 is
    generic(
        size            : integer := 32
    );
    port(
        input0          : in     vl_logic_vector;
        input1          : in     vl_logic_vector;
        input2          : in     vl_logic_vector;
        input3          : in     vl_logic_vector;
        sel             : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of size : constant is 1;
end MUX_4to1;
