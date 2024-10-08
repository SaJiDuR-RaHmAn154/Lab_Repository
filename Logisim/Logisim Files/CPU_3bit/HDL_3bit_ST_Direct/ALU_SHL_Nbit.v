module ALU_SHL_Nbit 
(
    input wire [2:0] A,B,  
    output reg [2:0] R
);

    wire [1:0] B2bit;
    assign B2bit = B[1:0];

    always @(*) begin
        case(B2bit)
            2'b00: R = A;                     // No shift
            2'b01: R = {A[2:0], 1'b0};        // Left shift by 1 bit
            2'b10: R = {A[1:0], 2'b00};       // Left shift by 2 bits
            2'b11: R = {A[0], 3'b000};        // Left shift by 3 bits
            default: R = A;                   // Default case (no shift)
        endcase
    end
    
endmodule