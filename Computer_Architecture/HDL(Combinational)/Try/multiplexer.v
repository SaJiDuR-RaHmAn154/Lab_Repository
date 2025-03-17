module Multiplexer(
    input wire [3:0] I,
    input wire [1:0] S,
    input wire E,
    output reg Y
);

// assign Y = E & ((~S[0] & ~S[1] & I[0]) + (S[0] & ~S[1] & I[1]) + (~S[0] & S[1] & I[2]) + (S[0] & S[1] & I[3]));

// always @(*) begin
//     if(E == 1'b0) Y = 1'b0;
//     else if(S == 2'b00) Y = I[0];
//     else if(S == 2'b01) Y = I[1];
//     else if(S == 2'b10) Y = I[2];
//     else if(S == 2'b11) Y = I[3];
//     else Y = 1'b0;
// end

always @(*) begin
    case({E, S})
        3'b100 : Y = I[0];
        3'b101 : Y = I[1];
        3'b110 : Y = I[2];
        3'b111 : Y = I[3];
        default : Y = 1'b0;
    endcase
end

endmodule