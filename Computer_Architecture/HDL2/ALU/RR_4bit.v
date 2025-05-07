module LR4bit 
(
    input wire [3:0] A,B  
    output reg [3:0] R
);

    wire [1:0] B2bit;
    assign B2bit = B[1:0];

    always @(*) begin
        case(B2bit)
            2'b00: R = A;                     // No Rotate
            2'b01: R = {A[0],A[3:1]};        // Right Rotate by 1 bit
            2'b10: R = {A[1],A[0], A[3:2]};       // Right Rotate by 2 bits
            2'b11: R = {A[2], A[1],A[0],A[3]};        // Right Rotate by 3 bits
            default: R = A;                   // Default case (no Rotate)
        endcase
    end
    
endmodule