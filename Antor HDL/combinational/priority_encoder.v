module Priority_Encoder(
    input wire E,
    input wire [3:0] D,
    output reg [1:0] B
);

// assign B[1] = ((D[2] & ~D[3]) + D[3]) & E;
// assign B[0] = ((D[1] & ~D[2] & ~D[3]) + D[3]) & E;

// always @(*) begin
//     if(E == 1'b0)
//         B = 2'b00;
//     else if(D[0] == 1'b1 && D[3:1] == 3'b000)
//         B = 2'b00;
//     else if(D[1] == 1 && D[3:2] == 2'b00)
//         B = 2'b01;
//     else if(D[2] == 1'b1 && D[3] == 1'b0)
//         B = 2'b10;
//     else if(D[3] == 1'b1)
//         B = 2'b11;
//     else B = 2'b00;
// end

always @(*) begin
    casex({E, D})
        5'b10001: B = 2'b00;
        5'b1001x: B = 2'b01;
        5'b101xx: B = 2'b10;
        5'b11xxx: B = 2'b11;
        default: B = 2'b00;
    endcase
end

endmodule