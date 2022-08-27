module Memory_stage (
    // input & output ports
    input   wire              CLK,
    input   wire              Reset,
    input   wire              MemWriteM,
    input   wire     [31:0]   WriteDataM,
    input   wire     [31:0]   ALUOutM,
    output  wire     [31:0]   ReadDataM,
    output  wire     [31:0]   test_value
);

Data_mem Data_mem_top_mips(
        .CLK(CLK), 
        .reset(Reset), 
        .WE(MemWriteM),
        .A(ALUOutM),
        .WD(WriteDataM),
        .RD(ReadDataM),
        .test_value(test_value)
    );
    
endmodule