module Decoder(
    input wire [2:0] B,
    input wire E,
    output reg [7:0] D
);


// // Method -> Assignment operator
// assign D[0] = ~B[0] & ~B[1] & ~B[2] & E;
// assign D[1] = B[0] & ~B[1] & ~B[2] & E;
// assign D[2] = ~B[0] & B[1] & ~B[2] & E;
// assign D[3] = B[0] & B[1] & ~B[2] & E;
// assign D[4] = ~B[0] & ~B[1] & B[2] & E;
// assign D[5] = B[0] & ~B[1] & B[2] & E;
// assign D[6] = ~B[0] & B[1] & B[2] & E;
// assign D[7] = B[0] & B[1] & B[2] & E;


// // Method -> If-Else Statement
// always@(*) begin
//     if(E == 1'b0)
//         D = 8'b00000000;
//     else if(B == 3'b000)
//         D = 8'b00000001;
//     else if(B == 3'b001)
//         D = 8'b00000010;
//     else if(B == 3'b010)
//         D = 8'b00000100;
//     else if(B == 3'b011)
//         D = 8'b00001000;
//     else if(B == 3'b100)
//         D = 8'b00010000;
//     else if(B == 3'b101)
//         D = 8'b00100000;
//     else if(B == 3'b110)
//         D = 8'b01000000;
//     else if(B == 3'b111)
//         D = 8'b10000000;
//     else
//         D = 8'b00000000;
// end


// Method -> Case Statement
always@(*) begin
    case({E, B})
        4'b1000: D = 8'b00000001;
        4'b1001: D = 8'b00000010;
        4'b1010: D = 8'b00000100;
        4'b1011: D = 8'b00001000;
        4'b1100: D = 8'b00010000;
        4'b1101: D = 8'b00100000;
        4'b1110: D = 8'b01000000;
        4'b1111: D = 8'b10000000;
        default: D = 8'b00000000;
    endcase
end


endmodule