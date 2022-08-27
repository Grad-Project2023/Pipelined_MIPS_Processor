module Write_back_reg (
    // input & output ports
    input   wire              CLK,
    input   wire              Reset,
    input   wire     [4:0]    WriteRegM,
    input   wire     [31:0]   ALUOutM,
    input   wire     [31:0]   ReadDataM,
    input   wire              RegWriteM,
    input   wire              MemtoRegM,
    output  reg      [4:0]    WriteRegW,
    output  reg      [31:0]   ALUOutW,
    output  reg      [31:0]   ReadDataW,
    output  reg               RegWriteW,
    output  reg               MemtoRegW
);

always @(posedge CLK, negedge Reset) begin
    if (!Reset) begin
        WriteRegW  <= 0;
        ALUOutW    <= 0;
        ReadDataW  <= 0;
        RegWriteW  <= 0;
        MemtoRegW  <= 0;
    end
    else begin
        WriteRegW  <= WriteRegM;
        ALUOutW    <= ALUOutM;
        ReadDataW  <= ReadDataM;
        RegWriteW  <= RegWriteM;
        MemtoRegW  <= MemtoRegM;
    end

end
    
endmodule