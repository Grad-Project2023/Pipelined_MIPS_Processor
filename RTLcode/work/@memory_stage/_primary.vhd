library verilog;
use verilog.vl_types.all;
entity Memory_stage is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        MemWriteM       : in     vl_logic;
        WriteDataM      : in     vl_logic_vector(31 downto 0);
        ALUOutM         : in     vl_logic_vector(31 downto 0);
        ReadDataM       : out    vl_logic_vector(31 downto 0);
        test_value      : out    vl_logic_vector(31 downto 0)
    );
end Memory_stage;
