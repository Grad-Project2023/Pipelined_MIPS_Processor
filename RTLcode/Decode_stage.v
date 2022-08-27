module Decode_stage (
    // input & output ports
    input   wire            CLk,
    input   wire            Reset,
    input   wire   [31:0]   InstrD,
    input   wire   [31:0]   PcPlus4D,
    input   wire            forwardAD,
    input   wire            forwardBD,
    input   wire            RegWriteW,
    input   wire   [4:0]    WriteRegW,
    input   wire   [31:0]   ResultW,
    input   wire   [31:0]   ALUoutM,
    input  wire             JumpD,
    input  wire             BranchD,
    output  wire   [31:0]   RD1D,
    output  wire   [31:0]   RD2D,
    output  wire   [4:0]    RsD,
    output  wire   [4:0]    RtD,
    output  wire   [4:0]    RdE_D,
    output  wire   [31:0]   signImmD,
    output  wire   [31:0]   PcBranchD,
    output  wire   [1:0]    PcScrD
);

//internal wires
wire [31:0] shiftout;
wire [31:0] RD1_mux_out;
wire [31:0] RD2_mux_out;
wire        EqualID;
wire        barnchSrcD;

assign RsD               = InstrD[25:21];
assign RtD               = InstrD[20:16];
assign RdE_D             = InstrD[15:11];
assign EqualID           = &(RD1_mux_out ~^ RD2_mux_out);
assign barnchSrcD        = EqualID & BranchD;
assign PcScrD            = {JumpD, barnchSrcD};



register_file                 register_file_D(.A1(InstrD[25:21]), .A2(InstrD[20:16]), .A3(WriteRegW), 
                                              .WE3(RegWriteW),  .reset(Reset), .WD3(ResultW), .clk(CLk), 
                                              .RD1(RD1D), .RD2(RD2D));


sign_extend                   sign_extend(.inst(InstrD[15:0]),  .signlmm(signImmD));

//shiftleft_2 #(.width(32))     shift(.in(signImmD), .out(shiftout));
assign shiftout  = signImmD<<2'b10;
assign PcBranchD = shiftout + PcPlus4D;
//adder                         branch_adder(.A(shiftout), .B(PcPlus4D), .Res(PcBranchD));

MUX_2to1 #(.size(32))         MUX1 (.input0(RD1D), .input1(ALUoutM), .sel(forwardAD), .out(RD1_mux_out));

MUX_2to1 #(.size(32))         MUX2 (.input0(RD2D), .input1(ALUoutM), .sel(forwardBD), .out(RD2_mux_out));



endmodule