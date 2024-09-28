module RS4bit 
(
    input wire [3:0] A,B,  
    output reg [3:0] R
);

    wire [1:0] B2bit;
    assign B2bit = B[1:0];

    always @(*) begin
        case(B2bit)
            2'b00: R = A;                     // No shift
            2'b01: R = {1'b0,A[3:1]};        // Right shift by 1 bit
            2'b10: R = {2'b00,A[3:2]};       // Right shift by 2 bits
            2'b11: R = { 3'b000,A[3]};        // Right shift by 3 bits
            default: R = A;                   // Default case (no shift)
        endcase
    end
    
endmodule