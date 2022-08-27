library verilog;
use verilog.vl_types.all;
entity register_file is
    port(
        A1              : in     vl_logic_vector(4 downto 0);
        A2              : in     vl_logic_vector(4 downto 0);
        A3              : in     vl_logic_vector(4 downto 0);
        WE3             : in     vl_logic;
        reset           : in     vl_logic;
        WD3             : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        RD1             : out    vl_logic_vector(31 downto 0);
        RD2             : out    vl_logic_vector(31 downto 0)
    );
end register_file;
