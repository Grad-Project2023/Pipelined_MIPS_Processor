module Memory_reg (
    // input & output ports
    input   wire             CLK,   
    input   wire             Reset,
    input   wire             RegWriteE,
    input   wire             MemtoRegE,
    input   wire             MemWriteE,
    input   wire    [4:0]    WriteRegE,
    input   wire    [31:0]   WriteDataE,
    input   wire    [31:0]   ALUOutE,
    output  reg              RegWriteM,
    output  reg              MemtoRegM,
    output  reg              MemWriteM,
    output  reg     [4:0]    WriteRegM,
    output  reg     [31:0]   WriteDataM,
    output  reg     [31:0]   ALUOutM
);

always @(posedge CLK, negedge Reset) begin
    if (!Reset) begin
        RegWriteM  <= 0;
        MemtoRegM  <= 0;
        MemWriteM  <= 0;
        WriteRegM  <= 0;
        WriteDataM <= 0;
        ALUOutM    <= 0;
    end
    else begin
        RegWriteM  <= RegWriteE;
        MemtoRegM  <= MemtoRegE;
        MemWriteM  <= MemWriteE;
        WriteRegM  <= WriteRegE;
        WriteDataM <= WriteDataE;
        ALUOutM    <= ALUOutE;
    end

end
    
endmodule