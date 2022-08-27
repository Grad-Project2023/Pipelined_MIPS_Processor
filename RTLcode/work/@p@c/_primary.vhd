library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        En              : in     vl_logic;
        PCi             : in     vl_logic_vector(31 downto 0);
        PCo             : out    vl_logic_vector(31 downto 0)
    );
end PC;
