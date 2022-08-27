library verilog;
use verilog.vl_types.all;
entity Fetch_stage is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        PcScrF          : in     vl_logic_vector(1 downto 0);
        PcBranchF       : in     vl_logic_vector(31 downto 0);
        PcjumpF         : in     vl_logic_vector(31 downto 0);
        stallF          : in     vl_logic;
        InstrF          : out    vl_logic_vector(31 downto 0);
        PcPlus4f        : out    vl_logic_vector(31 downto 0)
    );
end Fetch_stage;
