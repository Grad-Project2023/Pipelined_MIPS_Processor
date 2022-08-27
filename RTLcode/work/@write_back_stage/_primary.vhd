library verilog;
use verilog.vl_types.all;
entity Write_back_stage is
    port(
        ALUOutW         : in     vl_logic_vector(31 downto 0);
        ReadDataW       : in     vl_logic_vector(31 downto 0);
        MemtoRegW       : in     vl_logic;
        ResultW         : out    vl_logic_vector(31 downto 0)
    );
end Write_back_stage;
