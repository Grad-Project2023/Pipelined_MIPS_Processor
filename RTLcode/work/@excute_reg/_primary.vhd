library verilog;
use verilog.vl_types.all;
entity Excute_reg is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        CLR             : in     vl_logic;
        RegWriteD       : in     vl_logic;
        MemtoRegD       : in     vl_logic;
        MemWriteD       : in     vl_logic;
        ALUControlD     : in     vl_logic_vector(2 downto 0);
        ALUSrcD         : in     vl_logic;
        RegDstD         : in     vl_logic;
        RD1D            : in     vl_logic_vector(31 downto 0);
        RD2D            : in     vl_logic_vector(31 downto 0);
        RsD             : in     vl_logic_vector(4 downto 0);
        RtD             : in     vl_logic_vector(4 downto 0);
        RdE_D           : in     vl_logic_vector(4 downto 0);
        signImmD        : in     vl_logic_vector(31 downto 0);
        RD1E            : out    vl_logic_vector(31 downto 0);
        RD2E            : out    vl_logic_vector(31 downto 0);
        RsE             : out    vl_logic_vector(4 downto 0);
        RtE             : out    vl_logic_vector(4 downto 0);
        RdE             : out    vl_logic_vector(4 downto 0);
        signImmE        : out    vl_logic_vector(31 downto 0);
        RegWriteE       : out    vl_logic;
        MemtoRegE       : out    vl_logic;
        MemWriteE       : out    vl_logic;
        ALUControlE     : out    vl_logic_vector(2 downto 0);
        ALUSrcE         : out    vl_logic;
        RegDstE         : out    vl_logic
    );
end Excute_reg;
