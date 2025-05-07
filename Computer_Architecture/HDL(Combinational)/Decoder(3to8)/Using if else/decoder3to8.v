module decoder3to8
(
    input [2:0] A,
    input E,
    output reg [7:0] Y
);

always @(*)
begin
    if(E==1'b0) Y = 8'b00000000;
    else if(A==3'b000) Y = 8'b00000001;
    else if(A==3'b001) Y = 8'b00000010;
    else if(A==3'b010) Y = 8'b00000100;
    else if(A==3'b011) Y = 8'b00001000;
    else if(A==3'b100) Y = 8'b00010000;
    else if(A==3'b101) Y = 8'b00100000;
    else if(A==3'b110) Y = 8'b01000000;
    else Y = 8'b10000000;
end    
endmodule