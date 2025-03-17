module alu
(
    input wire [3:0] A, B,  // ALU 4-bit Inputs                 
    input wire [1:0] OP,    // ALU Operation selector (2-bit)
    output reg [3:0] R,     // ALU 4-bit Output
    output reg CF           // Carry Out Flag
);

    reg Sel;
    wire [3:0] R_ADD_SUB, R_SHL, R_NAND;
    wire CF_ADD_SUB;

    // Instantiate modules
    ADD_SUB4bit ADD_SUB1 ( .A(A), .B(B), .Sel(Sel), .R(R_ADD_SUB), .CF(CF_ADD_SUB));
    SHL4bit SHL1 ( .A(A), .B(B), .R(R_SHL));
    NAND4bit NAND1 ( .A(A), .B(B), .R(R_NAND));

    always @(*) 
    begin
        case (OP)
            2'b00: // Addition 
                begin 
                    Sel = 1'b0;  // Sel = 0 for Addition
                    R = R_ADD_SUB; 
                    CF = CF_ADD_SUB;
                end
            2'b01: // Subtraction 
                begin 
                    Sel = 1'b1;  // Sel = 1 for Subtraction
                    R = R_ADD_SUB;
                    CF = CF_ADD_SUB;
                end
            2'b10: // left Shift 
                begin 
                    R = R_SHL;
                    CF = 1'b0;
                end
            2'b11: // nand 
                begin 
                    R = R_NAND;
                    CF = 1'b0;
                end
            default: 
                begin
                    R = 4'b0000;  
                    CF = 1'b0;
                end
        endcase
    end

endmodule
