library verilog;
use verilog.vl_types.all;
entity Decode_reg is
    port(
        CLK             : in     vl_logic;
        Reset           : in     vl_logic;
        CLR             : in     vl_logic;
        EN              : in     vl_logic;
        InstrF          : in     vl_logic_vector(31 downto 0);
        PcPlus4f        : in     vl_logic_vector(31 downto 0);
        InstrD          : out    vl_logic_vector(31 downto 0);
        PcPlus4D        : out    vl_logic_vector(31 downto 0)
    );
end Decode_reg;
