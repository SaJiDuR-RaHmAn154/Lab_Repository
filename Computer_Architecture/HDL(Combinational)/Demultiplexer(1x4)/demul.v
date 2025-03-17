module demul (
    input I,
    input [1:0] S,
    output [3:0] Y
);

assign Y[0] = I & (~S[1] & ~S[0]); 
assign Y[1] = I & (~S[1] & S[0]); 
assign Y[2] = I & (S[1] & ~S[0]); 
assign Y[3] = I & (S[1] & S[0]); 

endmodule