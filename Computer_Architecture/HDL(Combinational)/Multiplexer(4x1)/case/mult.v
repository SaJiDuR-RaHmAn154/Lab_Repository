module multiplexer 
(
    input wire [1:0] S,
    input wire [3:0] I,
    output reg Y
);
 
always @(*) begin
    case (S)
       2'b00 : Y = I[0] & ~S[1] & ~S[0]; 
       2'b01 : Y = I[1] & ~S[1] & S[0]; 
       2'b10 : Y = I[2] & S[1] & ~S[0]; 
       2'b11 : Y = I[3] & S[1] & S[0]; 
    endcase
end
endmodule