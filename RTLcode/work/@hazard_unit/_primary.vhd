library verilog;
use verilog.vl_types.all;
entity Hazard_unit is
    port(
        RegWriteW       : in     vl_logic;
        WriteRegW       : in     vl_logic_vector(4 downto 0);
        WriteRegM       : in     vl_logic_vector(4 downto 0);
        WriteRegE       : in     vl_logic_vector(4 downto 0);
        RegWriteM       : in     vl_logic;
        MemtoRegM       : in     vl_logic;
        RegWriteE       : in     vl_logic;
        MemtoRegE       : in     vl_logic;
        RsE             : in     vl_logic_vector(4 downto 0);
        RtE             : in     vl_logic_vector(4 downto 0);
        RsD             : in     vl_logic_vector(4 downto 0);
        RtD             : in     vl_logic_vector(4 downto 0);
        JumpD           : in     vl_logic;
        BranchD         : in     vl_logic;
        ForwardAE       : out    vl_logic_vector(1 downto 0);
        ForwardBE       : out    vl_logic_vector(1 downto 0);
        ForwardAD       : out    vl_logic;
        ForwardBD       : out    vl_logic;
        FlushE          : out    vl_logic;
        StallF          : out    vl_logic;
        StallD          : out    vl_logic
    );
end Hazard_unit;
