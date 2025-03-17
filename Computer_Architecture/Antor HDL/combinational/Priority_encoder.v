module Pri_encoder(
    input enable,
    input [3:0] D,
    output reg [1:0] E
);

// always@(*) begin
//     casez({enable, D})
//         5'b10001: E = 2'b00;
//         5'b1001z: E = 2'b01;
//         5'b101zz: E = 2'b10;
//         5'b11zzz: E = 2'b11;
//         default: E = 2'b00;
//     endcase
// end

always@(*) begin
    if(enable == 0) E = 2'b00;
    else if(D[3] == 1) E = 2'b11;
    else if(D[2] == 1) E = 2'b10;
    else if(D[1] == 1) E = 2'b01;
    else if(D[0] == 1) E = 2'b00;
    else E = 2'b00;
end

endmodule