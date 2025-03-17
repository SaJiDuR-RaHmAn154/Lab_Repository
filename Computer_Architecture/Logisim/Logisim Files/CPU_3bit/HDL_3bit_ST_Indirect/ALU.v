module ALU
(
    input wire [2:0] A, B,                   
    input wire [1:0] OP,    
    output reg [2:0] R,     
    output wire CF,
    output wire SF,
    output wire ZF           
);

    reg Sel;
    wire [2:0] R_ADD_SUB, R_SHL;
    wire CF_ADD_SUB;

    // Instantiate modules
    ALU_ADD_SUB_Nbit ADD_SUB1 (.A(A), .B(B), .Sel(Sel), .R(R_ADD_SUB), .CF(CF_ADD_SUB));
    ALU_SHL_Nbit SHL1 (.A(A), .B(B), .R(R_SHL));

    always @(*) 
    begin
        case (OP)
            2'b00: // Addition 
                begin 
                    Sel = 1'b0;  // Sel = 0 for Addition
                    R = R_ADD_SUB; 
                end
            2'b01: // Subtraction 
                begin 
                    Sel = 1'b1;  // Sel = 1 for Subtraction
                    R = R_ADD_SUB;
                end
            2'b10: // left Shift 
                begin 
                    R = R_SHL;
                end
            default: 
                begin
                    R = 3'b000;
                end
        endcase
    end

    assign CF = (OP == 2'b00 || OP == 2'b01) ? CF_ADD_SUB : 1'b0;
    assign SF = R[2];
    assign ZF = ~(R[2] | R[1] | R[0]);

endmodule
