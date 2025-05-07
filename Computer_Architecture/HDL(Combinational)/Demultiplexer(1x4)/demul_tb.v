`timescale 1ns/1ps
module demul_tb;

reg I;
reg [1:0] S;
wire [3:0] Y;

demul uut
(
    .I(I),
    .S(S),
    .Y(Y)
);
initial begin

    $dumpfile("test.vcd");
    $dumpvars(0,demul_tb);
    
    I=1'b1;
    S=2'b00;
    #20;
    S=2'b01;
    #20;
    S=2'b10;
    #20;
    S=2'b11;
    #20;
    $finish;
end

initial begin
    $monitor("S1=%b|S0=%b|Y[3]=%b|Y[2]=%b|Y[1]=%b|Y[0]=%b",S[1],S[0],Y[3],Y[2],Y[1],Y[0]);
end
endmodule