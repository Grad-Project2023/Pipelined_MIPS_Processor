library verilog;
use verilog.vl_types.all;
entity Excute_stage is
    port(
        RD1E            : in     vl_logic_vector(31 downto 0);
        RD2E            : in     vl_logic_vector(31 downto 0);
        RtE             : in     vl_logic_vector(4 downto 0);
        RdE             : in     vl_logic_vector(4 downto 0);
        signImmE        : in     vl_logic_vector(31 downto 0);
        ALUControlE     : in     vl_logic_vector(2 downto 0);
        ALUSrcE         : in     vl_logic;
        RegDstE         : in     vl_logic;
        forwardAE       : in     vl_logic_vector(1 downto 0);
        forwardBE       : in     vl_logic_vector(1 downto 0);
        ALUoutM         : in     vl_logic_vector(31 downto 0);
        ResultW         : in     vl_logic_vector(31 downto 0);
        WriteRegE       : out    vl_logic_vector(4 downto 0);
        WriteDataE      : out    vl_logic_vector(31 downto 0);
        ALUOutE         : out    vl_logic_vector(31 downto 0)
    );
end Excute_stage;
