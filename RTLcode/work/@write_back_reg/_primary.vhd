library verilog;
use verilog.vl_types.all;
entity Write_back_reg is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        WriteRegM       : in     vl_logic_vector(4 downto 0);
        ALUOutM         : in     vl_logic_vector(31 downto 0);
        ReadDataM       : in     vl_logic_vector(31 downto 0);
        RegWriteM       : in     vl_logic;
        MemtoRegM       : in     vl_logic;
        WriteRegW       : out    vl_logic_vector(4 downto 0);
        ALUOutW         : out    vl_logic_vector(31 downto 0);
        ReadDataW       : out    vl_logic_vector(31 downto 0);
        RegWriteW       : out    vl_logic;
        MemtoRegW       : out    vl_logic
    );
end Write_back_reg;
