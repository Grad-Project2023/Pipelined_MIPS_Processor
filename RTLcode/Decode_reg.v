module Decode_reg (
    // input & output ports
    input  wire           CLK,   
    input  wire           Reset,
    input  wire           CLR,
    input  wire           EN,
    input  wire  [31:0]   InstrF,
    input  wire  [31:0]   PcPlus4f,
    output reg   [31:0]   InstrD,
    output reg   [31:0]   PcPlus4D
);

always @(posedge CLK, negedge Reset) begin
    if (!Reset) begin
        InstrD   <= 0;
        PcPlus4D <= 0;
    end
    else if(CLR&&!EN) begin
        InstrD   <= 0;
        PcPlus4D <= PcPlus4f;
    end
    else if(!EN) begin
        InstrD   <= InstrF;
        PcPlus4D <= PcPlus4f;
    end

end
    
endmodule