library verilog;
use verilog.vl_types.all;
entity Data_mem is
    port(
        CLK             : in     vl_logic;
        reset           : in     vl_logic;
        WE              : in     vl_logic;
        A               : in     vl_logic_vector(31 downto 0);
        WD              : in     vl_logic_vector(31 downto 0);
        RD              : out    vl_logic_vector(31 downto 0);
        test_value      : out    vl_logic_vector(31 downto 0)
    );
end Data_mem;
