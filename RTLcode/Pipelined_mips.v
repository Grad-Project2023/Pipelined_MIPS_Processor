module Pipelined_mips (
    //inputs & output ports
    input    wire          CLK,
    input    wire          Reset,
    output   wire [31:0]   test_value
);

//internal contor signals in Fetch stage
wire             StallF;
//************************************ 
//internal contor signals in Decode stage
wire    [1:0]    PcScrD;
wire             JumpD;
wire             BranchD;
wire             Decode_reg_clr;
wire             RegDstD;
wire             ALUSrcD;
wire             MemWriteD;
wire    [2:0]    ALUControlD;
wire             MemtoRegD;
wire             RegWriteD;
wire             ForwardAD;
wire             ForwardBD;
wire             StallD;
//************************************
//internal contor signals in Excute stage 
wire             RegWriteE;
wire             MemtoRegE;
wire             MemWriteE;
wire    [2:0]    ALUControlE;
wire             ALUSrcE;
wire             RegDstE;
wire    [1:0]    ForwardAE;
wire    [1:0]    ForwardBE;
wire             FlushE;
//************************************
//internal contor signals in Memory stage
wire             RegWriteM;
wire             MemWriteM;
wire             MemtoRegM;
//************************************
//internal contor signals in write_back stage
wire             RegWriteW;
wire             MemtoRegW;
//************************************
//internal wires in fetch stage
wire    [31:0]   PcPlus4f;
wire    [31:0]   InstrF;
//************************************
//internal wires in Decode stage
wire    [31:0]   InstrD;
wire    [31:0]   PcPlus4D;
wire    [31:0]   RD1D;
wire    [31:0]   RD2D;
wire    [4:0]    RsD;
wire    [4:0]    RtD;
wire    [4:0]    RdE_D;
wire    [31:0]   signImmD;
wire    [31:0]   PcBranchD;
//************************************
//internal wires in Excute stage
wire    [31:0]   RD1E;
wire    [31:0]   RD2E;
wire    [4:0]    RsE;
wire    [4:0]    RtE;
wire    [4:0]    RdE;
wire    [4:0]    WriteRegE;
wire    [31:0]   WriteDataE;
wire    [31:0]   ALUOutE;
wire    [31:0]   signImmE;
//************************************
//internal wires in Memory stage
wire    [4:0]    WriteRegM;
wire    [31:0]   ALUoutM;
wire    [31:0]   WriteDataM;
wire    [31:0]   ReadDataM;
//************************************
//internal wires in Write_back stage
wire    [31:0]   ReadDataW;
wire    [31:0]   ALUOutW;
wire    [31:0]   ResultW;
wire    [4:0]    WriteRegW;

CU                            CU_D(.Opcode(InstrD[31:26]), .Funct(InstrD[5:0]), .MemtoReg(MemtoRegD), 
                                   .MemWrite(MemWriteD), .Branch(BranchD), .ALUSrc(ALUSrcD), 
                                   .RegDSt(RegDstD), .RegWrite(RegWriteD), .jump(JumpD), 
                                   .ALUControl(ALUControlD));

Hazard_unit                   Hazard_unit_top(.RegWriteW(RegWriteW), .WriteRegW(WriteRegW), .WriteRegM(WriteRegM), 
                                              .WriteRegE(WriteRegE), .RegWriteM(RegWriteM), .MemtoRegM(MemtoRegM), 
                                              .RegWriteE(RegWriteE), .MemtoRegE(MemtoRegE), .RsE(RsE), .RtE(RtE), 
                                              .RsD(RsD), .RtD(RtD), .JumpD(JumpD), .BranchD(BranchD), 
                                              //outputs
                                              .ForwardAE(ForwardAE), .ForwardBE(ForwardBE), .ForwardAD(ForwardAD), 
                                              .ForwardBD(ForwardBD), .FlushE(FlushE), .StallF(StallF), .StallD(StallD));

Fetch_stage                   Fetch_stage_top(.CLK(CLK), .Reset(Reset), .PcScrF(PcScrD), .PcBranchF(PcBranchD), 
                                              .PcjumpF({PcPlus4D[31:28], InstrD[25:0], 2'b00}), .stallF(StallF), 
                                              .InstrF(InstrF), .PcPlus4f(PcPlus4f));

assign Decode_reg_clr = |PcScrD;
Decode_reg                    Decode_reg_top(.CLK(CLK),.Reset(Reset), .CLR(Decode_reg_clr), .EN(StallD), .InstrF(InstrF),
                                             .PcPlus4f(PcPlus4f), .InstrD(InstrD), .PcPlus4D(PcPlus4D));

Decode_stage                  Decode_stage_top(.CLk(CLK), .Reset(Reset), .InstrD(InstrD), .PcPlus4D(PcPlus4D), 
                                               .forwardAD(ForwardAD), .forwardBD(ForwardBD), .RegWriteW(RegWriteW), 
                                               .WriteRegW(WriteRegW), .ResultW(ResultW), .ALUoutM(ALUoutM),
                                               .JumpD(JumpD), .BranchD(BranchD), 
                                               //outputs
                                               .PcScrD(PcScrD), .RD1D(RD1D), .RD2D(RD2D), .RsD(RsD), 
                                               .RtD(RtD), .RdE_D(RdE_D), .signImmD(signImmD), .PcBranchD(PcBranchD));

Excute_reg                    Excute_reg_top(.CLK(CLK), .Reset(Reset), .CLR(FlushE), .RegWriteD(RegWriteD), .MemtoRegD(MemtoRegD), 
                                             .MemWriteD(MemWriteD), .ALUControlD(ALUControlD), .ALUSrcD(ALUSrcD), 
                                             .RegDstD(RegDstD), .RD1D(RD1D), .RD2D(RD2D), .RsD(RsD), .RtD(RtD), 
                                             .RdE_D(RdE_D), .signImmD(signImmD), 
                                             //outputs
                                             .RD1E(RD1E), .RD2E(RD2E), 
                                             .RsE(RsE), .RtE(RtE), .RdE(RdE), .signImmE(signImmE), .RegWriteE(RegWriteE), 
                                             .MemtoRegE(MemtoRegE), .MemWriteE(MemWriteE), .ALUControlE(ALUControlE), 
                                             .ALUSrcE(ALUSrcE), .RegDstE(RegDstE));

Excute_stage                  Excute_stage_top(.RD1E(RD1E), .RD2E(RD2E), .RtE(RtE), .RdE(RdE), .signImmE(signImmE), 
                                               .ALUControlE(ALUControlE), .ALUSrcE(ALUSrcE), .RegDstE(RegDstE), 
                                               .forwardAE(ForwardAE), .forwardBE(ForwardBE), .ALUoutM(ALUoutM), 
                                               .ResultW(ResultW), .WriteRegE(WriteRegE), .WriteDataE(WriteDataE), 
                                               .ALUOutE(ALUOutE));

Memory_reg                    Memory_reg_top(.CLK(CLK),.Reset(Reset), .RegWriteE(RegWriteE), .MemtoRegE(MemtoRegE), 
                                             .MemWriteE(MemWriteE), .WriteRegE(WriteRegE), .WriteDataE(WriteDataE), 
                                             .ALUOutE(ALUOutE), .RegWriteM(RegWriteM), .MemtoRegM(MemtoRegM), 
                                             .MemWriteM(MemWriteM), .WriteRegM(WriteRegM), .WriteDataM(WriteDataM), 
                                             .ALUOutM(ALUoutM));

Memory_stage                  Memory_stage_top(.CLK(CLK), .Reset(Reset), .MemWriteM(MemWriteM), .WriteDataM(WriteDataM), 
                                               .ALUOutM(ALUoutM), .ReadDataM(ReadDataM), .test_value(test_value));

Write_back_reg                Write_back_reg_top(.CLK(CLK), .Reset(Reset), .WriteRegM(WriteRegM), .ALUOutM(ALUoutM), 
                                                 .ReadDataM(ReadDataM), .RegWriteM(RegWriteM), .MemtoRegM(MemtoRegM), 
                                                 .WriteRegW(WriteRegW), .ALUOutW(ALUOutW), .ReadDataW(ReadDataW), 
                                                 .RegWriteW(RegWriteW), .MemtoRegW(MemtoRegW));

Write_back_stage              Write_back_stage_top(.ALUOutW(ALUOutW), .ReadDataW(ReadDataW), .MemtoRegW(MemtoRegW), 
                                                   .ResultW(ResultW));

endmodule