library verilog;
use verilog.vl_types.all;
entity Decode_stage is
    port(
        CLk             : in     vl_logic;
        Reset           : in     vl_logic;
        InstrD          : in     vl_logic_vector(31 downto 0);
        PcPlus4D        : in     vl_logic_vector(31 downto 0);
        forwardAD       : in     vl_logic;
        forwardBD       : in     vl_logic;
        RegWriteW       : in     vl_logic;
        WriteRegW       : in     vl_logic_vector(4 downto 0);
        ResultW         : in     vl_logic_vector(31 downto 0);
        ALUoutM         : in     vl_logic_vector(31 downto 0);
        JumpD           : in     vl_logic;
        BranchD         : in     vl_logic;
        RD1D            : out    vl_logic_vector(31 downto 0);
        RD2D            : out    vl_logic_vector(31 downto 0);
        RsD             : out    vl_logic_vector(4 downto 0);
        RtD             : out    vl_logic_vector(4 downto 0);
        RdE_D           : out    vl_logic_vector(4 downto 0);
        signImmD        : out    vl_logic_vector(31 downto 0);
        PcBranchD       : out    vl_logic_vector(31 downto 0);
        PcScrD          : out    vl_logic_vector(1 downto 0)
    );
end Decode_stage;
