library verilog;
use verilog.vl_types.all;
entity CU is
    port(
        Opcode          : in     vl_logic_vector(5 downto 0);
        Funct           : in     vl_logic_vector(5 downto 0);
        MemtoReg        : out    vl_logic;
        MemWrite        : out    vl_logic;
        Branch          : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegDSt          : out    vl_logic;
        RegWrite        : out    vl_logic;
        jump            : out    vl_logic;
        ALUControl      : out    vl_logic_vector(2 downto 0)
    );
end CU;
