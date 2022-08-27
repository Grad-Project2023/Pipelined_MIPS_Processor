module Write_back_stage (
    // input & output ports
    input  wire      [31:0]   ALUOutW,
    input  wire      [31:0]   ReadDataW,
    input  wire               MemtoRegW,
    output wire      [31:0]   ResultW
);

MUX_2to1 #(.size(32)) MUX1(
    .input0(ALUOutW), 
    .input1(ReadDataW), 
    .sel(MemtoRegW), 
    .out(ResultW)
    );
    
endmodule