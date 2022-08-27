library verilog;
use verilog.vl_types.all;
entity Pipelined_mips is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        test_value      : out    vl_logic_vector(31 downto 0)
    );
end Pipelined_mips;
