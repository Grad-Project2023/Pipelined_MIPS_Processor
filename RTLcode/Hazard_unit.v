module Hazard_unit (
    // input & output ports
    input   wire         RegWriteW,
    input   wire  [4:0]  WriteRegW,
    input   wire  [4:0]  WriteRegM,
    input   wire  [4:0]  WriteRegE,
    input   wire         RegWriteM,
    input   wire         MemtoRegM,
    input   wire         RegWriteE,
    input   wire         MemtoRegE,
    input   wire  [4:0]  RsE,
    input   wire  [4:0]  RtE,
    input   wire  [4:0]  RsD,
    input   wire  [4:0]  RtD,
    input   wire         JumpD,
    input   wire         BranchD,
    output  reg   [1:0]  ForwardAE,
    output  reg   [1:0]  ForwardBE,
    output  wire         ForwardAD,
    output  wire         ForwardBD,
    output  wire         FlushE,
    output  wire         StallF,
    output  wire         StallD
);

wire lwstall;
wire Branchstall_1;
wire Branchstall_2;
wire Branchstall;


assign lwstall       = ((RsD == RtE) || (RtD == RtE)) && MemtoRegE;
assign Branchstall_1 = (BranchD && RegWriteE && ((WriteRegE == RsD) || (WriteRegE == RtD)));
assign Branchstall_2 = (BranchD && MemtoRegM && ((WriteRegM == RsD) || (WriteRegM == RtD)));
assign Branchstall   = Branchstall_1 || Branchstall_2;
assign StallF        = lwstall || Branchstall;
assign StallD        = lwstall || Branchstall;
assign FlushE        = lwstall || Branchstall || JumpD;
assign ForwardAD     = (RsD != 5'b0) && (RsD == WriteRegM) && RegWriteM;
assign ForwardBD     = (RtD != 5'b0) && (RtD == WriteRegM) && RegWriteM;

always @(*) begin
    
    if ((RsE != 5'b0) && (RsE == WriteRegM) && RegWriteM) begin
        ForwardAE = 2'b10;
    end
    else if ((RsE != 5'b0) && (RsE == WriteRegW) && RegWriteW) begin
        ForwardAE = 2'b01;
    end
    else begin
        ForwardAE = 2'b00;
    end

end

always @(*) begin
    
    if ((RtE != 5'b0) && (RtE == WriteRegM) && RegWriteM) begin
        ForwardBE = 2'b10;
    end
    else if ((RtE != 5'b0) && (RtE == WriteRegW) && RegWriteW) begin
        ForwardBE = 2'b01;
    end
    else begin
        ForwardBE = 2'b00;
    end

end
    
endmodule