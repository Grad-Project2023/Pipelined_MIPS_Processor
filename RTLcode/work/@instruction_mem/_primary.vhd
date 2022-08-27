library verilog;
use verilog.vl_types.all;
entity Instruction_mem is
    port(
        Pc              : in     vl_logic_vector(31 downto 0);
        Instr           : out    vl_logic_vector(31 downto 0)
    );
end Instruction_mem;
