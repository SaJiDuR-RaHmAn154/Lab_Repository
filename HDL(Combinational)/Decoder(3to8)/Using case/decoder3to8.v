module decoder3to8
(
    input E,
    input [2:0] A,
    output reg [7:0] Y
);

always @*
begin
    case({E,A})
        4'b1000 : Y = 8'b00000001;
        4'b1001 : Y = 8'b00000010;
        4'b1010 : Y = 8'b00000100;
        4'b1011 : Y = 8'b00001000;
        4'b1100 : Y = 8'b00010000;
        4'b1101 : Y = 8'b00100000;
        4'b1110 : Y = 8'b01000000;
        4'b1111 : Y = 8'b10000000;
        default : Y = 8'b00000000;
    endcase
end    

endmodule