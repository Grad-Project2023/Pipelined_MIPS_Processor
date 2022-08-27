library verilog;
use verilog.vl_types.all;
entity Memory_reg is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        RegWriteE       : in     vl_logic;
        MemtoRegE       : in     vl_logic;
        MemWriteE       : in     vl_logic;
        WriteRegE       : in     vl_logic_vector(4 downto 0);
        WriteDataE      : in     vl_logic_vector(31 downto 0);
        ALUOutE         : in     vl_logic_vector(31 downto 0);
        RegWriteM       : out    vl_logic;
        MemtoRegM       : out    vl_logic;
        MemWriteM       : out    vl_logic;
        WriteRegM       : out    vl_logic_vector(4 downto 0);
        WriteDataM      : out    vl_logic_vector(31 downto 0);
        ALUOutM         : out    vl_logic_vector(31 downto 0)
    );
end Memory_reg;
