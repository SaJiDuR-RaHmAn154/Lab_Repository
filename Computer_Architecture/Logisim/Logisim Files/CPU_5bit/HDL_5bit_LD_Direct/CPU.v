module CPU
(
    input wire clk,
    input wire reset,
    input wire PC_Enable,
    input wire [10:0] RAM_Write_Data,
    input wire [2:0] RAM_Write_Address,
    input wire RAM_Write_Enable,
    input wire [4:0] InD,
    input wire InE,
    output wire [2:0] PC,
    output wire [10:0] PI,
    output wire [4:0] OutD,
    output wire [4:0] REG0, output wire [4:0] REG1, output wire [4:0] REG2, output wire [4:0] REG3,
    output wire [10:0] RAM0, output wire [10:0] RAM1, output wire [10:0] RAM2, output wire [10:0] RAM3,
    output wire [10:0] RAM4, output wire [10:0] RAM5, output wire [10:0] RAM6, output wire [10:0] RAM7
);
    wire CPU_CLK;
    wire [2:0] Write_Address, Program_Address, Next_Program_Address;
    wire [10:0] Write_Data, Program_Instruction;
    wire Write_Enable;
    wire [10:0] LD_Data;

    Program_Counter PC_circuit1 (.clk(CPU_CLK), .reset(reset), .I(Next_Program_Address), .O(Program_Address));

    RAM_MxNbit RAM_circuit1 (.clk(clk), .reset(reset), .Write_Data(RAM_Write_Data),
                        .Write_Address(Write_Address), .Write_Enable(RAM_Write_Enable),
                        .Read_Address_1(Program_Address), .Read_Address_2(LD_ADDR),
                        .Read_Data_1(Program_Instruction), .Read_Data_2(LD_Data),
                        .RAMrow0(RAM0), .RAMrow1(RAM1), .RAMrow2(RAM2), .RAMrow3(RAM3),
                        .RAMrow4(RAM4), .RAMrow5(RAM5), .RAMrow6(RAM6), .RAMrow7(RAM7)
    );

    wire [3:0] Opcode;
    wire ZF, SF, CF, dZF, dSF, dCF, REG_EN, IMM_SEL, JMP_SEL, LD_SEL;
    wire [1:0] OP;

    assign Opcode = Program_Instruction[10:7];

    CU CU_circuit1 (.Opcode(Opcode), .ZF(dZF), .SF(dSF), .CF(dCF), .OP(OP), .REG_EN(REG_EN), 
                        .IMM_SEL(IMM_SEL), .JMP_SEL(JMP_SEL), .LD_SEL(LD_SEL));

    FLAG_Register FLAG_circuit1 (.clk(CPU_CLK), .reset(reset), .CF(CF), .SF(SF), .ZF(ZF), 
                                .dCF(dCF), .dSF(dSF), .dZF(dZF));

    wire [1:0] RA, RB, WR; 
    wire [4:0] A, B, B_Final, R, IMM_DATA, RR;
    wire [2:0] JMP_ADDR, LD_ADDR;

    assign WR = Program_Instruction[6:5];
    assign RA = Program_Instruction[6:5];
    assign RB = Program_Instruction[4:3];
    assign IMM_DATA = Program_Instruction[4:0];
    assign JMP_ADDR = Program_Instruction[6:4];
    assign LD_ADDR = Program_Instruction[4:2];

    assign RR = (LD_SEL) ? LD_Data[4:0] : R;

    RFSet RF_circuit1 (.clk(CPU_CLK), .reset(reset), .RA(RA), .RB(RB), .RE(REG_EN), .InD(InD), .InE(InE), .OutD(OutD),
        .WR(WR), .WRD(RR), .A(A), .B(B), .R0(REG0), .R1(REG1), .R2(REG2), .R3(REG3));

    assign B_Final = (IMM_SEL) ? IMM_DATA : B;

    ALU ALU_circuit1 (.A(A), .B(B_Final), .OP(OP), .R(R), .CF(CF), .SF(SF), .ZF(ZF));

    assign CPU_CLK = clk & PC_Enable;
    assign PC = Program_Address;
    assign PI = Program_Instruction;

    assign Next_Program_Address = (JMP_SEL) ? JMP_ADDR : Program_Address + 1;

    assign Write_Data = RAM_Write_Data;
    assign Write_Address = RAM_Write_Address;

endmodule